extends Area2D

@onready var deerAnimation = $Collision/DeerSprite
#@onready var player = $Collision/DeerSprite/AnimationPlayer

# Called when the animal is clicked.
func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == MOUSE_BUTTON_LEFT \
	and event.pressed:
		deerAnimation.play("deer")
