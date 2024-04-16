extends Node

@onready var code_edit = $"../../.."
@onready var feedback_handler = $"../FeedbackHandler"

func _ready():
	pass

func run_popup(status_id: int):
	match status_id:
		3:
			code_edit._emit_accepted_status()
			print("Accepted") # Debug Statement
			# TODO: Make Accepted GUI - Proceed Level
		4:
			print("Wrong Answer") # Debug Statement
		_:
			pass
			# TODO: Exception Handling
