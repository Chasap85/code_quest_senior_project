extends Node

@onready var dialogue = $DialogueBalloon
@onready var infoBox = $InfoBox
@onready var ciea = $Ciea


func _ready():
	pass

func _start_animation():
	dialogue.hide()
	ciea._start_ciea_animation()
	await ciea.animation_looped
	dialogue.show()
	
func _on_dialogue_balloon_hide_info():
	infoBox.hide()
