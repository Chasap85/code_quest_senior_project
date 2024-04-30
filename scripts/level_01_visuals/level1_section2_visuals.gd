extends Node

@onready var map = $Map2
@onready var pings = $Map2/Pings
@onready var arrow = $RedArrow
@onready var arrow_animation = $RedArrow/ArrowAnimation

func _ready():
	pass

func _start_animation():
	pings.show()
	map.show()
	map._start_pings_exit()
	arrow.show()
	arrow_animation.play("blink_arrow")
	pass
