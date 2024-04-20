extends Node

@onready var dialogue = $DialogueBalloon
@onready var infoBox = $InfoBox
@onready var ciea = $Ciea


func _ready():
	pass

func _start_animation():
	ciea._start_ciea_animation()
	await ciea.animation_looped
