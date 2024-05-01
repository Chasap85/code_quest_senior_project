extends Node2D

#region Constants
const MAIN_MENU_SCENE = "res://level-scenes/main_menu.tscn"
const LEVEL_DATA_PATH = "res://assets/level-data/level_2_data.json"
#endregion

#region Onready Variables
@onready var transition = $TransitionScene
@onready var tutorial_node = $Tutorial
@onready var animation_node_1 = $AnimationNode1
@onready var animation_node_2 = $AnimationNode2
@onready var animation_node_3 = $AnimationNode3
@onready var animation_node_4 = $AnimationNode4
@onready var visuals_handler = $VisualsHandler
@onready var data_handler = $DataHandler
@onready var code_editor_node= $CodeEditorNode
@onready var challenge_description_node = $ChallengeDescription
#endregion

func _ready():
	visuals_handler.set_animation_list([
		tutorial_node,
		animation_node_1, # Name the bear
		animation_node_2, # Count bandaids
		animation_node_3, # Use bandaids
		animation_node_4] # Is Bear Healed
	)
	visuals_handler.play_current_animation()
	data_handler.load_level_data(LEVEL_DATA_PATH)
	
#region Signals
func _on_back_pressed():
	get_tree().change_scene_to_file(MAIN_MENU_SCENE)
#endregion
