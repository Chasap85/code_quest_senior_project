extends Node2D

@onready var data_handler = $DataHandler
@onready var animation_handler = $AnimationHandler
@onready var transition = $TransitionScene
@onready var animation_node_1 = $AnimationNode1
@onready var animation_node_2 = $AnimationNode2

# Called when the node enters the scene tree for the first time.
func _ready():
	animation_handler._set_animation_list([animation_node_1, animation_node_2])
	animation_handler._play_current_animation()
	data_handler.load_level_data("res://assets/level-data/level_2_data.json")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_back_pressed():
	get_tree().change_scene_to_file("res://level-scenes/menu.tscn")


func _on_dialogue_balloon_show_info():
	pass # Replace with function body.
