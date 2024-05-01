extends Node2D

#region Constants
const MAIN_MENU_SCENE = "res://level-scenes/main_menu.tscn"
const LEVEL_DATA_PATH = "res://assets/level-data/level_1_data.json"
#endregion

#region Onready Variables
@onready var code_editor_node = $CodeEditorNode
@onready var challenge_description_node = $ChallengeDescription
@onready var data_handler = $DataHandler
@onready var tutorial_node = $Tutorial
@onready var animation_node_1 = $AnimationNode1
@onready var animation_node_2 = $AnimationNode2
@onready var animation_node_3 = $AnimationNode3
@onready var visuals_handler = $VisualsHandler
@onready var map = $Map
@onready var transition = $TransitionScene
#endregion

func _ready():
	visuals_handler._set_animation_list([
		tutorial_node, 
		animation_node_1, # Count red dots
		animation_node_2, # Assign variable to city name
		animation_node_3] # Percent Corrupted Calculation
	)
	visuals_handler._play_current_animation()
	data_handler.load_level_data(LEVEL_DATA_PATH)

#region Signals
func _on_back_pressed():
	get_tree().change_scene_to_file(MAIN_MENU_SCENE)

func _on_dialogue_start_challenge():
	code_editor_node.show()
	challenge_description_node.show()
#endregion
