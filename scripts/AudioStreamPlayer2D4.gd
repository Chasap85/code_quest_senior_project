extends AudioStreamPlayer2D

var audio_stream_player

func _ready():
	# Get the AudioStreamPlayer node
	audio_stream_player = get_node("Ship/AudioStreamPlayer2D4")

	# Start a timer to play the audio stream player after one second
	$Timer.start(1)

func _on_Timer_timeout():
	# Check if audio stream player is not already playing
	if not audio_stream_player.is_playing():
		audio_stream_player.play()
