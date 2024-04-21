extends AnimatedSprite2D

# for animation player
@onready var animate := $CharlesAnim

# Called when the node enters the scene tree for the first time.
func _ready():
	_start_charles_animation()
	pass

func _start_charles_animation():
	show()
	animate.play("ciea-enters")
	await animate.animation_finished
	play("charles")

# Ciea leaves when her dialogue ends
func _on_dialogue_balloon_hide_ciea():
	animate.play_backwards("ciea-enters")
