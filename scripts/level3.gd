extends Node2D

@onready var data_handler = $DataHandler

# Called when the node enters the scene tree for the first time.
func _ready():
	data_handler.load_level_data("res://assets/level-data/level_3_data.json")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_back_pressed():
	get_tree().change_scene_to_file("res://level-scenes/menu.tscn")
