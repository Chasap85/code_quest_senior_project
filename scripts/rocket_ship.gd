extends CharacterBody2D

@export var move_speed : float = 100

var last_input_direction = Vector2.ZERO

func _physics_process(_delta):
	var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	
	velocity = input_direction * move_speed
	
	move_and_slide()
	
# Update last input direction if input is non-zero
	if input_direction != Vector2.ZERO:
		last_input_direction = input_direction
	
	# Continuously look in the direction of the last input
	if last_input_direction != Vector2.ZERO:
		look_at(position + last_input_direction * 100)

# Define the target position for changing levels
const TARGET_POSITION = Vector2(387, 629)
const TRIGGER_RADIUS = 10

# Define the level to change to
const NEXT_LEVEL = "res://level-scenes/level1.tscn"

func _process(delta):
	# Check if the character's position reaches the target position
	# Calculate the distance between the character and the target position
	var distance = position.distance_to(TARGET_POSITION)
	
	# Check if the character is within the trigger radius
	if distance <= TRIGGER_RADIUS:
		# Change the level
		change_level()

func change_level():
	# Load the next level scene
	var level = load(NEXT_LEVEL)
	
	# Change the scene
	get_tree().change_scene_to_file("res://level-scenes/level1.tscn")
