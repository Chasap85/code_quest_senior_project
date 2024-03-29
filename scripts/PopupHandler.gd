extends Node

func _ready():
	pass

func run_popup(status_id: int):
	match status_id:
		3:
			print("Accepted") # Debug Statement
			# TODO: Make Accepted GUI - Proceed Level
		4:
			print("WA - Make GUI") # Debug Statement
			# TODO: Make WA GUI
		_:
			pass
			# TODO: Exception Handling
