extends Node

#region Constants
const LEVEL_SELECTION_SCENE = "res://level-scenes/level_selection.tscn"
#endregion

#region Onready Variables
@onready var code_editor_node = $"../CodeEditorNode"
@onready var challenge_description_node = $"../ChallengeDescription"
#endregion

#region Global Variables
var _animation_list: Array = []
var _current_animation_index: int = 0
var _current_animation: Node = null
#endregion

func _ready():
	_hide_code_editor()

func set_animation_list(new_animation_list: Array):
	_animation_list = new_animation_list

func play_current_animation():	
	if _current_animation_index >= _animation_list.size():
		# No more animations, level is completed
		push_warning("Reached the end of animations to play.")
		get_tree().change_scene_to_file(LEVEL_SELECTION_SCENE)
		return
	
	if _current_animation_index == 1:  # Tutorial over, show editor
		_show_code_editor()
	
	_current_animation = _animation_list[_current_animation_index]
	_current_animation._start_animation()
	_current_animation_index += 1

func destroy_active_animation():
	if _current_animation:
		_current_animation.queue_free()
		_current_animation = null

#region Private Methods
func _hide_code_editor():
	code_editor_node.hide()
	challenge_description_node.hide()

func _show_code_editor():
	code_editor_node.show()
	challenge_description_node.show()
#endregion
