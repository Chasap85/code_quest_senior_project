extends Area2D

@onready var deerAnimation = $Collision/DeerSprite
@onready var player = $Collision/DeerSprite/AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Called when the animal is clicked.
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == MOUSE_BUTTON_LEFT \
	and event.pressed:
		self.play_animation()

# Function to play the animation
func play_animation():
	deerAnimation.play("deer")
