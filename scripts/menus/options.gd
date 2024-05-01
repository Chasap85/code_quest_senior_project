extends Control

const MAIN_MENU_SCENE = "res://level-scenes/main_menu.tscn"

func _ready():
	pass

func _on_back_button_pressed():
	get_tree().change_scene_to_file(MAIN_MENU_SCENE)
