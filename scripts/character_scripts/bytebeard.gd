extends AnimatedSprite2D

signal hide_dialogue
@onready var animate := $CieaAnim

func _ready():
	pass

func _start_bytebeard_animation():
	show()
	animate.play("ciea-enters")
	await animate.animation_finished

func _on_dialogue_hide_charles():
	animate.play_backwards("ciea-enters")
	emit_signal("hide_dialogue")
