extends CharacterBody2D

@export var move_speed : float = 200

var last_input_direction = Vector2.ZERO

const TARGET_POSITIONS = [
	{"position": Vector2(387, 629), "level": "res://level-scenes/level_01.tscn"},
	{"position": Vector2(566, 200), "level": "res://level-scenes/level_02.tscn"},
	{"position": Vector2(1110, 200), "level": "res://level-scenes/level_03.tscn"}
]

const TRIGGER_RADIUS = 40

func _physics_process(_delta):
	var input_direction = get_input_direction()
	velocity = input_direction * move_speed
	move_and_slide()
	update_last_input(input_direction)
	look_in_last_direction()

func _process(delta):
	check_trigger_positions()

func get_input_direction():
	return Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)

func update_last_input(input_direction):
	if input_direction != Vector2.ZERO:
		last_input_direction = input_direction

func look_in_last_direction():
	if last_input_direction != Vector2.ZERO:
		look_at(position + last_input_direction * 100)

func check_trigger_positions():
	for target in TARGET_POSITIONS:
		var distance = position.distance_to(target["position"])
		if distance <= TRIGGER_RADIUS:
			change_level(target["level"])
			break

func change_level(level):
	get_tree().change_scene_to_file(level)
