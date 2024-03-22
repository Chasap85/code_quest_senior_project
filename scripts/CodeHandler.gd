extends Node

# API Settings
@onready var http_request = $HTTPRequest
const url = "TODO"
var page = "/api/"

# Globals
var code = ""

func _ready():
	pass

# Code sent from codeEditor
func _receive_code(code_text: String) -> void:
	print("Code received from codeEditor.gd: ", code_text) # Debug statement
	code = code_text

# Send user code to Judge0 for Evaluation
func _api_request(code: String) -> void:
	pass
	'''
	TODO: 
		http_request.request(URL + page)
	'''

# Result from JudgeAPI
func _on_request_completed(result, response_code, headers, body):
	pass 
	'''
	TODO:
		var json = JSON.parse_string() ...
	'''

# Handle Result parsed from JudgeAPI
func _handle_judge_result(result: String):
	pass
	'''
	TODO:
		If Valid --> Trigger Progression Handler
		Else --> [
			1. WA --> Notify user of incorrect submission.
			2. RTE / CE --> Notify user of issue using JudgeAPI error message
		]
	'''
