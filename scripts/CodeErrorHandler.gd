extends Node

func _ready():
	pass

'''
TODO:
	6: Prompt User to Run Code Again OR Submit Again
	13: Prompt User to Run Code Again OR Submit Again
	
	7 - 12: Runtime Errors
		This is a bar raiser goal for this project. It is another endeavour
		to implement actionable feedback for the user's code.
		
	_: Exception Handle
'''
func _run_error_handler(status_id: int):
	match status_id:
		1:
			pass # Impossible Case
		2:
			pass # Impossible Case
		5:
			pass # TLE
		6:
			pass # Compile Error
		7:
			pass # Runtime Error
		8:
			pass # Runtime Error
		9:
			pass # Runtime Error
		10:
			pass # Runtime Error
		11:
			pass # Runtime Error
		12:
			pass # Runtime Error
		13:
			pass # Internal Error
		_:
			pass
