extends Node

const Utils = preload("res://scripts/utils.gd")

#region Reference Variables (Nodes)
@onready var code_editor: Node = $"../../"
@onready var feedback_handler: Node = $FeedbackHandler
@onready var http_request: HTTPRequest = $HTTPRequest
@onready var popup_ac: Node = $"../../../PopupAC"
@onready var popup_wa: Node = $"../../../PopupWA"
@onready var utils = Utils.new()
#endregion

#region API Information
const URL: String = "https://judge0-ce.p.rapidapi.com/submissions"
const API_KEY: String = "4b14b6aa5cmsh07aa52259174fa6p1dcdafjsn4360ca5f4056"

var api_headers: Dictionary = {
	"content-type": "application/json",
	"Content-Type": "application/json",
	"X-RapidAPI-Key": API_KEY,
	"X-RapidAPI-Host": "judge0-ce.p.rapidapi.com"
}

var submission_payload: Dictionary = {
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
#endregion

var has_run: bool = false # Flag to prevent infinite API calls

func _ready() -> void:
	pass

# Entry Point
func send_code_for_evaluation(new_code: String) -> void:
	if not has_run:
		submission_payload["source_code"] = new_code
		if not new_code.is_empty():
			# popup_ac.answer_accepted()
			# feedback_handler.request_feedback(new_code)
			_send_submission()
		else:
			popup_wa.incorrect_submission("Please add code.")
	else:
		popup_ac.answer_accepted()

func _send_submission() -> void:
	if not has_run:
		var headers: PackedStringArray = _build_headers()
		var payload_text: String = JSON.stringify(submission_payload)
		http_request.connect("request_completed", _on_submission_response)
		http_request.request(URL, headers, HTTPClient.METHOD_POST, payload_text)

func _on_submission_response(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray) -> void:
	if not has_run:
		var json_data: Dictionary = utils.parse_json(body)
		var submission_token: String = json_data["token"]
		_get_submission_result(submission_token)

func _get_submission_result(submission_token: String) -> void:
	if not has_run:
		http_request.connect("request_completed", _on_submission_result_received)
		var result_url: String = URL + "/" + submission_token
		var headers: PackedStringArray = _build_headers()
		http_request.request(result_url, headers, HTTPClient.METHOD_GET)

func _on_submission_result_received(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray) -> void:
	if not has_run:
		_process_result(body)
		has_run = true

func _process_result(response_body: PackedByteArray) -> void:
	var json_data: Dictionary = utils.parse_json(response_body)
	var status_id: StatusID = json_data["status"]["id"]
	print('json_data: ', json_data)
	match status_id:
		StatusID.ACCEPTED:
			popup_ac.answer_accepted()
		StatusID.WRONG_ANSWER:
			feedback_handler.request_feedback(submission_payload["source_code"])
		_:
			feedback_handler.request_feedback(submission_payload["source_code"])

func _build_headers() -> PackedStringArray:
	var headers: PackedStringArray = PackedStringArray()
	for key in api_headers.keys():
		headers.append(key + ": " + api_headers[key])
	return headers

func set_expected_output(new_output: Variant) -> void:
	submission_payload["expected_output"] = new_output
