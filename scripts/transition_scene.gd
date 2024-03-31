extends ColorRect

# Path to the next scene to transition to
var next_scene_path : String

# Reference to the _AnimationPlayer_ node
@onready var animate := $Fade

signal transitioned

# Called when the node enters the scene tree for the first time.
func _ready():
	animate.play_backwards('fade')
		
	# Plays the animation backwards to fade in

func transition_to(_next_scene:= next_scene_path) -> void:
	print("transition_to")
	# Plays the Fade animation and wait until it finishes
	animate.play("fade")
	await animate.animation_finished
	# Changes the scene
	get_tree().change_scene_to_file(_next_scene)
	

func _on_transitioned(animation_title):
	if animation_title == "fade-in":
		print('fade in')
		emit_signal("transitioned")
		animate.play_backwards("fade")
	if animation_title == "fade-out":
		print('fade out')
		emit_signal("transitioned")
		animate.play("fade")
