extends Node

var _animation_list: Array
var _current_animation_index: int
var _current_animation: Node

func _ready():
	_current_animation_index = 0

func _set_animation_list(_new_animation_list: Array):
	_animation_list = _new_animation_list

func _play_current_animation():
	if _current_animation_index >= _animation_list.size():
		push_warning("Reached the end of animations to play.")
		return
	_current_animation = _animation_list[_current_animation_index]
	_current_animation._start_animation()
	_current_animation_index += 1

func _destroy_active_animation():
	_current_animation.queue_free()

