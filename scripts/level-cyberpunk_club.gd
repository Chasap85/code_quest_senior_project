extends Node2D

@onready var dialogue = $DialogueBalloon
@onready var infoBox = $InfoBox
@onready var ciea = $Ciea

@onready var transition = $TransitionScene

func _ready():
	dialogue.hide()
	await ciea.animation_looped
	dialogue.show()

# next level
	# _transition.transition_to("Path to next scene")


func _on_dialogue_balloon_hide_info():
	infoBox.hide()
	ciea.animate.play_backwards("ciea-enters")
