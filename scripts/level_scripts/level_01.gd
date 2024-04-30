extends Node2D

@onready var codeEdit = $CodeEditorNode
@onready var codePrompt = $CodePrompt
@onready var animation_handler = $AnimationHandler
@onready var data_handler = $DataHandler
@onready var animation_node_0 = $AnimationNode0
@onready var animation_node_1 = $AnimationNode1
@onready var animation_node_2 = $AnimationNode2
@onready var animation_node_3 = $AnimationNode3
@onready var map = $Map

@onready var transition = $TransitionScene

signal start_challenge
signal map_popup

func _ready():
	animation_handler._set_animation_list([
		animation_node_0, 
		animation_node_1, 
		animation_node_2,
		animation_node_3]
	)
	animation_handler._play_current_animation()
	data_handler.load_level_data("res://assets/level-data/level_1_data.json")

func _on_back_pressed():
	get_tree().change_scene_to_file("res://level-scenes/main_menu.tscn")

# next level
	# _transition.transition_to("Path to next scene")

func _on_dialogue_start_challenge():
	codeEdit.show()
	codePrompt.show()
	

func _on_white_wizard_map_popup():
	map._start_map_popup()
