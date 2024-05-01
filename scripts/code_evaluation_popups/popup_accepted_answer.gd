extends Node2D

@onready var data_handler = $"../DataHandler"
@onready var visuals_handler = $"../VisualsHandler"

func _ready():
	pass

func answer_accepted():
	show()

func _on_continue_pressed():
	hide()
	visuals_handler.destroy_active_animation()
	visuals_handler.play_current_animation()
	data_handler.load_next_section()
