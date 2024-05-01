extends Node2D

#region Constants
const MAIN_MENU_SCENE = "res://level-scenes/main_menu.tscn"
const LEVEL_DATA_PATH = "res://assets/level-data/level_3_data.json"
const AUDIO_DELAY = 1.0
#endregion

#region Onready Variables
@onready var tutorial_node = $Tutorial
@onready var animation_node_1 = $AnimationNode1
@onready var animation_node_2 = $AnimationNode2
@onready var animation_node_3 = $AnimationNode3
@onready var audio_stream_player = $Ship/AudioStreamPlayer2D4
@onready var data_handler = $DataHandler
@onready var visuals_handler = $VisualsHandler
#endregion

func _ready():
	visuals_handler._set_animation_list([
		tutorial_node,
		animation_node_1, # Can Kraken be defeated (inventory check)
		animation_node_2, # Defend and Attack back
		animation_node_3] # Defend and final blow
		)
	visuals_handler._play_current_animation()
	data_handler.load_level_data(LEVEL_DATA_PATH)
	$Timer.start(AUDIO_DELAY)

#region Signals
func _on_back_pressed():
	get_tree().change_scene_to_file(MAIN_MENU_SCENE)
#endregion
