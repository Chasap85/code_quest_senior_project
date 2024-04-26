extends Node

@onready var dialogue = $Dialogue
@onready var infoBox = $InfoBox
@onready var bytebeard = $Bytebeard

func _ready():
	dialogue.hide()

func _start_animation():
	bytebeard._start_bytebeard_animation()
	await get_tree().create_timer(1.0).timeout
	dialogue.show()
