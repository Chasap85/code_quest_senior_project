extends Node

# API Settings
@onready var http_request = $HTTPRequest
const URL = "https://judge0-ce.p.rapidapi.com/submissions"
const API_KEY = "4b14b6aa5cmsh07aa52259174fa6p1dcdafjsn4360ca5f4056" 

var api_headers = {
	"content-type": "application/json",
	"Content-Type": "application/json",
	"X-RapidAPI-Key": API_KEY,
	"X-RapidAPI-Host": "judge0-ce.p.rapidapi.com"
}

var submission_payload = {
	"source_code": '',
	"language_id": 71, # Language ID for Python on Judge0
	"stdin": "",
	"expected_output": "hello, world!", # NOTE TODO: NEEDS TO BE DYNAMIC!!!
	"cpu_time_limit": 2, # CPU time limit in seconds
	"cpu_extra_time": 0.5, # Extra CPU time for compilation
	"wall_time_limit": 5, # Wall time limit in seconds
	"memory_limit": 128000, # Memory limit in bytes
	"stack_limit": 64000, # Stack limit in bytes
	"max_processes_and_or_threads": 30, # Max processes or threads
	"enable_per_process_and_thread_time_limit": false,
	"enable_per_process_and_thread_memory_limit": false,
	"max_file_size": 1024 # Maximum allowed file size
}

# Globals
var source_code = ''
var submission_token = '' 
var payload_text = ''
var headers = []

var has_run = false; # Flag to prevent infinite API calls

func _ready():
	pass

# Code sent from CodeEditor
func _on_code_received(new_code: String) -> void:
	if not has_run:
		source_code = new_code
		_prepare_submission()

# Prepare submission data
func _prepare_submission() -> void:
	if not has_run:
		for key in api_headers.keys(): # Headers
			headers.append(key + ": " + api_headers[key])
		submission_payload["source_code"] = source_code # Body
		payload_text = JSON.stringify(submission_payload) 
		_send_submission()

# Send submission to Judge0
func _send_submission() -> void:
	if not has_run:
		http_request.connect("request_completed", _on_submission_response)
		http_request.request(URL, headers, HTTPClient.METHOD_POST, payload_text)
	
# Submission confirmation response from JudgeAPI
func _on_submission_response(result, response_code, headers, body) -> void:
	if not has_run:
		_extract_token_and_fetch_result(body)
	
# Parse token from Submission confirmation response
func _extract_token_and_fetch_result(response_body) -> void:
	if not has_run:
		var json_parser = JSON.new()
		var json_string = response_body.get_string_from_utf8()
		var json_data = JSON.parse_string(json_string)
		submission_token = json_data["token"]
		_get_submission_result()

# Get result of submission
func _get_submission_result() -> void:
	if not has_run:
		http_request.connect("request_completed", _on_result_received)
		var result_url = URL + "/" + submission_token
		http_request.request(result_url, headers, HTTPClient.METHOD_GET)

# Submission result received
func _on_result_received(result, response_code, headers, body) -> void:
	if not has_run:
		_process_result(body)

func _process_result(response_body) -> void:
	if not has_run:
		var json_parser = JSON.new()
		var json_string = response_body.get_string_from_utf8()
		var json_data = JSON.parse_string(json_string)

		var status_id = json_data["status"]["id"]
		'''
		TODO:
			Perform game actions based on ID
		'''
		if status_id == 3:
			print("Accepted") # Debug Statement
		elif status_id == 4:
			print("Wrong Answer") # Debug Statement
			
		has_run = true # Prevent script from making more API calls.
	has_run = true
