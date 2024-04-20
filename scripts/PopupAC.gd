extends Node2D

@onready var data_handler = $"../DataHandler"

func _ready():
	pass

func answer_accepted():
	show()

func _on_continue_pressed():
	hide()
	data_handler.load_next_section()
