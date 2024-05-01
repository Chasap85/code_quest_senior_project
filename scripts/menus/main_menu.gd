extends Control

const LEVEL_SELECT_SCENE = "res://level-scenes/level_selection.tscn"
const OPTIONS_SCENE = "res://level-scenes/options.tscn"

@onready var transition = $TransitionScene

func _ready():
	pass

func _on_play_pressed():
	get_tree().change_scene_to_file(LEVEL_SELECT_SCENE)

func _on_options_pressed():
	get_tree().change_scene_to_file(OPTIONS_SCENE)

func _on_quit_pressed():
	get_tree().quit()
