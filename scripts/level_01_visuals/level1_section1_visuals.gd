extends Node

@onready var map = $Map

func _ready():
	pass

func _start_animation():
	await get_tree().create_timer(.5).timeout
	map._start_pings_popup()
	map._start_map_popup()
	pass
