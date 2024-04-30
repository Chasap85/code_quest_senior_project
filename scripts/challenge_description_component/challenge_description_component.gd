extends Control

@onready var text_box = $TextEdit

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func update_challenge_description(challenge_description: String) -> void:
	text_box.set_text(challenge_description)
