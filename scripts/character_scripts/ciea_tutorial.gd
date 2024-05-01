extends AnimatedSprite2D

signal hide_dialogue
@onready var animate := $CieaAnim

func _ready():
	pass

func _start_ciea_animation():
	show()
	animate.play("ciea-enters")
	play("ciea-eyes")

func _on_dialogue_balloon_hide_ciea():
	animate.play_backwards("ciea-enters")
