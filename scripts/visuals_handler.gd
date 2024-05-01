extends Node

@onready var code_editor_node = get_node("../CodeEditorNode")
@onready var challenge_description_node = get_node("../ChallengeDescription")

var _animation_list: Array
var _current_animation_index: int
var _current_animation: Node

func _ready():
	_current_animation_index = 0
	_hide_code_editor()

func _set_animation_list(_new_animation_list: Array):
	_animation_list = _new_animation_list

func _play_current_animation():
	print("playcurrent", _current_animation_index)
	if _current_animation_index >= _animation_list.size():
		# No more animations, level is completed
		push_warning("Reached the end of animations to play.")
		get_tree().change_scene_to_file("res://level-scenes/level_selection.tscn")
		return
	if _current_animation_index == 1: # Tutorial over, show editor
		_show_code_editor()
	_current_animation = _animation_list[_current_animation_index]
	_current_animation._start_animation()
	_current_animation_index += 1

func _destroy_active_animation():
	_current_animation.queue_free()

func _hide_code_editor():
	code_editor_node.hide()
	challenge_description_node.hide()

func _show_code_editor():
	code_editor_node.show()
	challenge_description_node.show()
