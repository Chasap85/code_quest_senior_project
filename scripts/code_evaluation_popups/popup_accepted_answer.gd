extends Node2D

@onready var data_handler = $"../DataHandler"
@onready var animation_handler = $"../AnimationHandler"

func _ready():
	pass

func answer_accepted():
	show()

func _on_continue_pressed():
	hide()
	animation_handler._destroy_active_animation()
	animation_handler._play_current_animation()
	data_handler.load_next_section()
