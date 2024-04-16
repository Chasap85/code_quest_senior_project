extends Node

@onready var http_request = $HTTPRequest

#region Data Variables for API Query
var gpt_system_prompt = ""
var code_task = ""
var user_code = ""
var answer_key_prompt = ""
#endregion

func _ready():
	_load_gpt_system_prompt()

# Entry Point
func on_wrong_answer(task_description, submitted_code, solution_prompt):
	code_task = task_description
	user_code = submitted_code
	answer_key_prompt = solution_prompt
	_query_chatgpt()

func _query_chatgpt():
	var url = "https://api.openai.com/v1/chat/completions"
	var api_key = "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"

	var headers = [
		"Content-Type: application/json",
		"Authorization: Bearer " + api_key
	]

	var messages = [
		{"role": "system", "content": ""},
		{"role": "user", "content": "In this coding game, the user is tasked with: " + code_task},
		{"role": "user", "content": "Expected: " + answer_key_prompt},
		{"role": "user", "content": "User's Code: " + user_code}
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
	var json_data = _parse_json(body)
	if json_data.has("choices"):
		var feedback = json_data.choices[0].message.content
		print("Debug: ChatGPT Feedback:")
		print(feedback)
	else:
		push_error("Invalid JSON response format.")

func _parse_json(data):
	var json_parser = JSON.new()
	var json_string = data.get_string_from_utf8()
	var json_data = JSON.parse_string(json_string)
	return json_data
	
func _load_gpt_system_prompt():
	var file_path = "res://assets/level-data/gpt_system_prompt.txt"
	var file = FileAccess.open(file_path, FileAccess.READ)
	if not file:
		print("Could not open JSON:", file_path)
		return
	gpt_system_prompt = file.get_as_text()
