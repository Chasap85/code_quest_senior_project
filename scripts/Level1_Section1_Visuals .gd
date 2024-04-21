extends Node

@onready var dialogue = $DialogueBalloon
@onready var infoBox = $InfoBox
@onready var ciea = $Ciea
@onready var whiteWizard = $WhiteWizard
@onready var map = $Map

func _ready():
	pass

func _start_animation():
	ciea._start_ciea_animation()
	await ciea.animation_looped
	dialogue.show()

func _on_dialogue_balloon_hide_info():
	infoBox.hide()
