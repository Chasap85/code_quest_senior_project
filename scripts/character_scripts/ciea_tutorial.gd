extends AnimatedSprite2D

# for animation player
@onready var animate := $CieaAnim

signal hide_dialogue
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _start_ciea_animation():
	show()
	animate.play("ciea-enters")
	play("ciea-eyes")


func _on_dialogue_balloon_hide_ciea():
	animate.play_backwards("ciea-enters")
