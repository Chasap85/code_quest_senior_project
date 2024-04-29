extends Node2D

@onready var data_handler = $DataHandler
@onready var animation_handler = $AnimationHandler
@onready var transition = $TransitionScene
@onready var animation_node_0 = $AnimationNode0
@onready var animation_node_1 = $AnimationNode1
@onready var animation_node_2 = $AnimationNode2
@onready var animation_node_3 = $AnimationNode3
@onready var animation_node_4 = $AnimationNode4
@onready var code_editor_node= $CodeEditorNode
@onready var code_prompt_node = $CodePrompt

# Called when the node enters the scene tree for the first time.
func _ready():
	code_editor_node.hide()
	code_prompt_node.hide()
	animation_handler._set_animation_list([
		animation_node_0, # Tutorial
		animation_node_1, # Name the bear
		animation_node_2, # Count bandaids
		animation_node_3, # Use bandaids
		animation_node_4] # Is Bear Healed
	)
	animation_handler._play_current_animation()
	data_handler.load_level_data("res://assets/level-data/level_2_data.json")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_back_pressed():
	get_tree().change_scene_to_file("res://level-scenes/menu.tscn")


func _on_dialogue_balloon_show_info():
	pass # Replace with function body.
