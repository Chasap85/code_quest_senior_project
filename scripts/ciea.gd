extends AnimatedSprite2D

# for animation player
@onready var animate := $CieaAnim

# Called when the node enters the scene tree for the first time.
func _ready():
	_start_ciea_animation()
	pass

func _start_ciea_animation():
	show()
	animate.play("ciea-enters")
	await animate.animation_finished
	play("ciea-eyes")

# Ciea leaves when her dialogue ends
func _on_dialogue_balloon_hide_ciea():
	animate.play_backwards("ciea-enters")
