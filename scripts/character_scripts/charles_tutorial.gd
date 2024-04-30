extends AnimatedSprite2D

# for animation player
@onready var animate := $CharlesAnim

signal hide_dialogue
# Called when the node enters the scene tree for the first time.
func _ready():
	_start_charles_animation()

func _start_charles_animation():
	show()
	animate.play("ciea-enters")
	await animate.animation_finished
	play("charles")

func _on_dialogue_balloon_hide_charles():
	animate.play_backwards("ciea-enters")
	emit_signal("hide_dialogue")
