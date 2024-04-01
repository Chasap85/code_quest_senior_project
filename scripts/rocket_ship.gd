extends CharacterBody2D

@export var move_speed : float = 100

func _physics_process(_delta):
	var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	
	velocity = input_direction * move_speed
	
	move_and_slide()
	
	look_at(velocity * 1000)
	
	
# Define the target position for changing levels
const TARGET_POSITION = Vector2(387, 629)
const TRIGGER_RADIUS = 10

# Define the level to change to
const NEXT_LEVEL = "res://level-scenes/level-cyberpunk_club.tscn"

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
	get_tree().change_scene_to_file("res://level-scenes/level-cyberpunk_club.tscn")
