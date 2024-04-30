extends Node

@onready var map = $Map3
@onready var arrow = $RedArrow
@onready var arrow_animation = $RedArrow/ArrowAnimation

func _ready():
	pass

func _start_animation():
	arrow.show()
	map.show()
	arrow_animation.play("arrow_shrink")
	pass
