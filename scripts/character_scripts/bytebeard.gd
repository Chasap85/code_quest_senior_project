extends AnimatedSprite2D

# for animation player
@onready var animate := $CieaAnim

signal hide_dialogue
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _start_bytebeard_animation():
	show()
	animate.play("ciea-enters")
	await animate.animation_finished

func _on_dialogue_hide_charles():
	animate.play_backwards("ciea-enters")
	emit_signal("hide_dialogue")
