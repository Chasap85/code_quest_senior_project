extends Node2D

@onready var dataHandler = $DataHandler
@onready var visuals_handler = $VisualsHandler
@onready var tutorial = $Tutorial
@onready var animation_node_1 = $AnimationNode1
@onready var animation_node_2 = $AnimationNode2
@onready var animation_node_3 = $AnimationNode3

var audio_stream_player
# Called when the node enters the scene tree for the first time.
func _ready():
	dataHandler.load_level_data("res://assets/level-data/level_3_data.json")
	# Get the AudioStreamPlayer node
	audio_stream_player = get_node("Ship/AudioStreamPlayer2D4")
	# start animation handling
	visuals_handler._set_animation_list([
		tutorial,
		animation_node_1, # Can Kraken be defeated (inventory check)
		animation_node_2, # Defend and Attack back
		animation_node_3] # Defend and final blow
		)
	visuals_handler._play_current_animation()
	# Start a timer to play the audio stream player after one second
	$Timer.start(1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_back_pressed():
	get_tree().change_scene_to_file("res://level-scenes/main_menu.tscn")

func _on_Timer_timeout():
	# Check if audio stream player is not already playing
	if not audio_stream_player.is_playing():
		audio_stream_player.play()
