extends Node

@onready var popup_ac = $"../PopupAC"
@onready var popup_wa = $"../PopupWA"

signal code_prompt_update(new_text)
signal code_edit_update(new_text, new_output)

# Global counter to track current scene
var section_idx = 0
var level_sections

func _ready():
	popup_ac.continue_next_section.connect(_load_next_section)


func _on_path_received(file_path: String):
	var file = FileAccess.open(file_path, FileAccess.READ)
	if not file:
		print("Could not open JSON:", file_path)
		return
	var json_str := file.get_as_text()
	var level_content: Dictionary = JSON.parse_string(json_str)
	level_sections = level_content["level_sections"]
	_emit_level_data()
	file.close()
	

func _emit_level_data():
	if section_idx > level_sections.size() - 1:
		print("Error: Loading level data out of bounds.")
		return
	var curr_section = level_sections[section_idx]
	code_prompt_update.emit(curr_section["task_prompt"])
	code_edit_update.emit(curr_section["starter_code"], curr_section["expected_output"])
	section_idx += 1

func _load_next_section():
	_emit_level_data()
	# TODO: Emit signal to animations
