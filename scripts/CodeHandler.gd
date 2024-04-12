extends Node

# Child scripts
@onready var error_handler = $CodeErrorHandler
@onready var popup_handler = $PopupHandler
@onready var data_handler = $"../DataHandler"

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
	"expected_output": 3,
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

# API Response IDs
enum StatusID { 
	IN_QUEUE = 1, 
	PROCESSING = 2,
	ACCEPTED = 3, 
	WRONG_ANSWER = 4, 
	TIME_LIMIT_EXCEEDED = 5, 
	COMPILATION_ERROR = 6,
	RUNTIME_ERROR_SIGSEGV = 7,
	RUNTIME_ERROR_SIGXFSZ = 8,
	RUNTIME_ERROR_SIGFPE = 9,
	RUNTIME_ERROR_SIGABRT = 10,
	RUNTIME_ERROR_NZEC = 11,
	RUNTIME_ERROR_OTHER = 12,
	INTERNAL_ERROR = 13,
	EXEC_FORMAT_ERROR = 14
}

# Globals
var source_code = ''
var submission_token = '' 
var payload_text = ''
var headers = []

var has_run = false; # Flag to prevent infinite API calls

func _ready():
	print("Code Verification Running...")
	pass

# Code sent from CodeEditor
func _on_code_received(new_code: String) -> void:
	if not has_run:
		print("Debug: Code received from editor")
		# Add print statement at end here directly rather than IDE
		source_code = new_code
		if source_code.is_empty():
			pass # TODO: Handle case user deletes their entire code and runs (?)
		else:
			_prepare_submission()
	
	if has_run:
		popup_handler.run_popup(StatusID.ACCEPTED)

# Prepare submission data
func _prepare_submission() -> void:
	if not has_run:
		print("Debug: Converting code to API Payload")
		for key in api_headers.keys(): # Headers
			headers.append(key + ": " + api_headers[key])
		submission_payload["source_code"] = source_code # Body
		payload_text = JSON.stringify(submission_payload) 
		_send_submission()

# Send submission to Judge0
func _send_submission() -> void:
	if not has_run:
		print("Debug: Code being sent to Judge")
		print("Debug: Submission created")
		print("Debug: Request to Judge to receive results")
		http_request.connect("request_completed", _on_submission_response)
		http_request.request(URL, headers, HTTPClient.METHOD_POST, payload_text)
	
# Submission confirmation response from JudgeAPI
func _on_submission_response(result, response_code, headers, body) -> void:
	if not has_run:
		_extract_token_and_fetch_result(body)
	
# Parse token from Submission confirmation response
func _extract_token_and_fetch_result(response_body) -> void:
	if not has_run:
		var json_data = _parse_json(response_body)
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
		print("Debug: Results received. Processing...")
		var json_data = _parse_json(response_body)
		var status_id : StatusID = json_data["status"]["id"]

		match status_id:
			StatusID.IN_QUEUE:
				error_handler._run_error_handler(StatusID.IN_QUEUE)
			StatusID.PROCESSING:
				error_handler._run_error_handler(StatusID.PROCESSING)
			StatusID.ACCEPTED:
				error_handler._run_error_handler(StatusID.IN_QUEUE)
				popup_handler.run_popup(StatusID.ACCEPTED)
			StatusID.WRONG_ANSWER:
				popup_handler.run_popup(StatusID.WRONG_ANSWER)
			StatusID.TIME_LIMIT_EXCEEDED:
				error_handler._run_error_handler(StatusID.TIME_LIMIT_EXCEEDED)
		
		has_run = true # Prevent script from making more API calls.
	has_run = true
	
func _parse_json(data):
	var json_parser = JSON.new()
	var json_string = data.get_string_from_utf8()
	var json_data = JSON.parse_string(json_string)
	return json_data

func _set_expected_output(new_output):
	submission_payload["expected_output"] = new_output
	
