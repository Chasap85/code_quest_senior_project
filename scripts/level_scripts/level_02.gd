extends Node2D

@onready var data_handler = $DataHandler
@onready var visuals_handler = $VisualsHandler
@onready var transition = $TransitionScene
@onready var tutorial = $Tutorial
@onready var animation_node_1 = $AnimationNode1
@onready var animation_node_2 = $AnimationNode2
@onready var animation_node_3 = $AnimationNode3
@onready var animation_node_4 = $AnimationNode4
@onready var code_editor_node= $CodeEditorNode
@onready var challenge_description_node = $ChallengeDescription

# Called when the node enters the scene tree for the first time.
func _ready():
	code_editor_node.hide()
	challenge_description_node.hide()
	visuals_handler._set_animation_list([
		tutorial, # Tutorial
		animation_node_1, # Name the bear
		animation_node_2, # Count bandaids
		animation_node_3, # Use bandaids
		animation_node_4] # Is Bear Healed
	)
	visuals_handler._play_current_animation()
	data_handler.load_level_data("res://assets/level-data/level_2_data.json")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_back_pressed():
	get_tree().change_scene_to_file("res://level-scenes/main_menu.tscn")


func _on_dialogue_balloon_show_info():
	pass # Replace with function body.
