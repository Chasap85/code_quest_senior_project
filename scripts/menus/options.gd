extends Control
const MAIN_MENU_SCENE = "res://level-scenes/main_menu.tscn"
const MASTER_VOL_IDX = 0
const VOLUME_REDUCE_FACTOR = 10

@onready var volume_slider = $MarginContainer/VBoxContainer/HBoxContainer/VolumeSlider

func _ready():
	var initial_volume: float = db_to_linear(
		AudioServer.get_bus_volume_db(MASTER_VOL_IDX)
	)
	_set_volume_slider(initial_volume)
	pass

func _on_back_button_pressed():
	get_tree().change_scene_to_file(MAIN_MENU_SCENE)

func _set_volume_slider(value: float):
	volume_slider.value = value * VOLUME_REDUCE_FACTOR
	pass

func _on_volume_slider_changed(new_volume: float):
	AudioServer.set_bus_volume_db(
		MASTER_VOL_IDX,
		linear_to_db(new_volume / VOLUME_REDUCE_FACTOR)
	)
