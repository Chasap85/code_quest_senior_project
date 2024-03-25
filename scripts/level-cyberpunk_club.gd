extends Node2D

var d_resource = preload("res://assets/dialogue/level-1.dialogue")
@onready var _animation_player = $AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	print("Play scene")
	#DialogueManager.show_example_dialogue_balloon(d_resource)
