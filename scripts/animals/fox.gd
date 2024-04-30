extends Area2D

@onready var foxAnimation = $Collision/DeerSprite


# Called when the animal is clicked.
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == MOUSE_BUTTON_LEFT \
	and event.pressed:
		self.play_animation()

# Function to play the animation
func play_animation():
	foxAnimation.play("fox")
