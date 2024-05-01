extends Control

@onready var text_box = $TextEdit

func _ready():
	pass

func update_challenge_description(challenge_description: String) -> void:
	text_box.set_text(challenge_description)
