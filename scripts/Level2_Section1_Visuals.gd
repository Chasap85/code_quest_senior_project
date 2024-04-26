extends Node

@onready var dialogue = $DialogueBalloon
@onready var infoBox = $InfoBox
@onready var charles = $Charles


func _ready():
	pass

func _start_animation():
	charles._start_charles_animation()
	await charles.animation_looped
	dialogue.show()

func _on_dialogue_balloon_hide_info():
	infoBox.hide()
