extends Node

@onready var dialogue = $DialogueBalloon
@onready var infoBox = $InfoBox
@onready var red_arrow = $RedArrow
@onready var sick_bear = $SickBear

func _ready():
	pass

func _start_animation():
	print("anim_1")
	red_arrow.show()
	sick_bear.show()

func _on_dialogue_balloon_hide_info():
	pass
