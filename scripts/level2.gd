extends Node2D

@onready var dataHandler = $DataHandler

# Called when the node enters the scene tree for the first time.
func _ready():
	dataHandler._on_path_received("res://assets/level-data/level_2_data.json")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_back_pressed():
	get_tree().change_scene_to_file("res://level-scenes/menu.tscn")
