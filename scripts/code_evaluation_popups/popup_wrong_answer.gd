extends Node2D

@onready var feedback_box = $PopupContainer/FeedbackBox

func _ready():
	pass

func incorrect_submission(feedback: String) -> void:
	feedback_box.set_text(feedback)
	show()

func _on_continue_pressed():
	hide()
