extends Node2D

var d_resource = preload("res://assets/dialogue/level-1.dialogue")
@onready var _animation_player = $AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	DialogueManager.show_example_dialogue_balloon(d_resource)
	
# Callback function to handle dialogue events
func on_dialogue_event(event):
	match event.name:
		"line_displayed":
			# Trigger animations or other actions based on which line of dialogue is displayed
			var current_line = event.data["line"]
			match current_line:
				"Ceia: Great! So this lesson will be of great help":
					# Trigger animation for this line of dialogue
					# Example: $AnimationPlayer.play("ceia_animation")
					_animation_player.play("component_wizard-hand-animation.tscn")
				"Ciea: Now, we have to use our new variables to make a program.":
					# Trigger animation for this line of dialogue
					# Example: $AnimationPlayer.play("ciea_animation")
					_animation_player.play("component_wizard-hand-animation.tscn")
