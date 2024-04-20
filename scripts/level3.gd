extends Node2D

@onready var dataHandler = $DataHandler
var audio_stream_player
# Called when the node enters the scene tree for the first time.
func _ready():
	dataHandler._on_path_received("res://assets/level-data/level_3_data.json")
	# Get the AudioStreamPlayer node
	audio_stream_player = get_node("Ship/AudioStreamPlayer2D4")
	# Start a timer to play the audio stream player after one second
	$Timer.start(1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_back_pressed():
	get_tree().change_scene_to_file("res://level-scenes/menu.tscn")

func _on_Timer_timeout():
	# Check if audio stream player is not already playing
	if not audio_stream_player.is_playing():
		audio_stream_player.play()
