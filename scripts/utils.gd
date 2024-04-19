extends Node

'''
ChallengeData class represents the data for a coding challenge.

- Description: What the user is asked to do.
- Starter_code: Initial code provided in the code editor, instead of starting with a blank box.
- Expected_output: Expected output that the user's solution should produce, used for validation by the Judge0 API.
- Solution_prompt: A reference solution used by ChatGPT to provide feedback and guidance to the user.

This class serves as a structured way to store and manage the data associated with each coding challenge.
'''
class ChallengeData:
	var description: String
	var starter_code: String
	var expected_output: String
	var solution_prompt: String

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func load_file_as_string(file_path: String) -> String:
	var file = FileAccess.open(file_path, FileAccess.READ)
	if not file:
		push_error("Could not open file: " + file_path)
		return ""
	
	var content = file.get_as_text()
	file.close()
	return content
	
func parse_json(data):
	var json_parser = JSON.new()
	var json_string = data.get_string_from_utf8()
	return JSON.parse_string(json_string)
