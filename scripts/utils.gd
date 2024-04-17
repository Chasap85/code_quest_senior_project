extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


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
