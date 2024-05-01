extends Node2D

@onready var codeEdit = $CodeEditorNode
@onready var codePrompt = $CodePrompt
@onready var visuals_handler = $VisualsHandler
@onready var data_handler = $DataHandler
@onready var tutorial_node = $Tutorial
@onready var animation_node_1 = $AnimationNode1
@onready var animation_node_2 = $AnimationNode2
@onready var animation_node_3 = $AnimationNode3
@onready var map = $Map

@onready var transition = $TransitionScene

signal start_challenge
signal map_popup

func _ready():
	visuals_handler._set_animation_list([
		tutorial_node, 
		animation_node_1, # Count red dots
		animation_node_2, # Assign variable to city name
		animation_node_3] # Percent Corrupted Calculation
	)
	visuals_handler._play_current_animation()
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
