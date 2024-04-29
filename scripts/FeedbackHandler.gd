extends Node

const Utils = preload("res://scripts/utils.gd")

class ChatGPTPromptData:
	var gpt_system_prompt: String
	var challenge_description: String
	var user_code: String
	var solution_prompt: String

#region Reference Variables (Nodes)
@onready var http_request = $HTTPRequest
@onready var utils = Utils.new()
@onready var popup_wa = $"../../../../PopupWA"
#endregion

var prompt_data: ChatGPTPromptData
var challenge_data: Utils.ChallengeData

func _ready():
	challenge_data = Utils.ChallengeData.new()
	var file_path = "res://assets/level-data/gpt_system_prompt.txt"
	prompt_data = ChatGPTPromptData.new()
	prompt_data.gpt_system_prompt = utils.load_file_as_string(file_path)

# Entry Point from CodeHandler
func request_feedback(user_code: String) -> void:
	prompt_data.user_code = user_code
	# _dummy_feedback()
	_query_chatgpt() # DISABLED TO NOT USE UP CHATGPT CREDITS - REMOVE COMMENT TO TEST CHATGPT

func _query_chatgpt():
	var url = "https://api.openai.com/v1/chat/completions"
	var api_key = "sk-proj-O9vrhVSAMLeudJlahlDZT3BlbkFJL3CqTiScJD3H1bHQh9u8"

	var headers = [
		"Content-Type: application/json",
		"Authorization: Bearer " + api_key
	]

	var messages = [
		{"role": "system", "content": prompt_data.gpt_system_prompt},
		{"role": "user", "content": "In this coding game, the user is tasked with: " + prompt_data.challenge_description},
		{"role": "user", "content": "User's Code: " + prompt_data.user_code},
		{"role": "user", "content": "Expected: " + prompt_data.solution_prompt}
	]

	var data = {
		"model": "gpt-3.5-turbo",
		"messages": messages,
		"temperature": 0.3,
		"max_tokens": 256,
		"top_p": 1,
		"frequency_penalty": 0,
		"presence_penalty": 0
	}

	var query = JSON.stringify(data)
	http_request.connect("request_completed", _on_request_completed)
	http_request.request(url, headers, HTTPClient.METHOD_POST, query)
	print("Debug: ChatGPT API Request Sent")

func _on_request_completed(result, response_code, headers, body):
	var json_data = utils.parse_json(body)
	if json_data.has("choices"):
		var feedback = json_data.choices[0].message.content
		print("Debug: ChatGPT Feedback:")
		print(feedback)
		popup_wa.incorrect_submission(feedback)
	else:
		push_error("Invalid JSON response format.")

func update_data(challenge_data: Utils.ChallengeData):
	prompt_data.challenge_description = challenge_data.description
	prompt_data.solution_prompt = challenge_data.solution_prompt

# Testing Function
func _dummy_feedback() -> void:
	popup_wa.incorrect_submission("FEEDBACK")
