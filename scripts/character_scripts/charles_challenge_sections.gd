extends AnimatedSprite2D

signal hide_dialogue
@onready var animate := $AnimationPlayer

func _ready():
	hide()

func _start_charles_animation():
	show()
	
