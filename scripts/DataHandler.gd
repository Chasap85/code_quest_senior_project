extends Node

const Utils = preload("res://scripts/utils.gd")

@onready var challenge_description_component = $"../CodePrompt"
@onready var code_editor_component = $"../CodeEditorNode"

var challenge_data: Utils.ChallengeData
var _level_sections: Array
var _current_section_index: int

func _ready() -> void:
	_current_section_index = 0
	challenge_data = Utils.ChallengeData.new()

func load_level_data(file_path: String) -> void:
	var utils = Utils.new()
	var json_str := utils.load_file_as_string(file_path)
	if json_str.is_empty():
		push_error("Failed to load level data. Please check the file path.")
		return

	var level_content = JSON.parse_string(json_str)
	if level_content.has("level_sections"):
		_level_sections = level_content["level_sections"]
		_load_current_section()
	else:
		push_error("Invalid level data format. Missing 'level_sections' key.")

func _load_current_section() -> void:
	if _current_section_index >= _level_sections.size():
		push_warning("Reached the end of level sections.")
		return

	var current_section = _level_sections[_current_section_index]	
	challenge_data.description = current_section.get("task_prompt", "")
	challenge_data.starter_code = current_section.get("starter_code", "")
	challenge_data.expected_output = current_section.get("expected_output", "")
	challenge_description_component.update_challenge_description(challenge_data.description)
	code_editor_component.update_section_data(challenge_data)
	_current_section_index += 1

func load_next_section() -> void:
	_load_current_section()
