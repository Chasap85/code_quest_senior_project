extends Node2D

@onready var feedback_box = $PopupContainer/FeedbackBox

func _ready():
	pass

func incorrect_submission():
	# TODO: Connect feedback thru PopupHandler and Feedback Handler
	# feedback_box.set_text()
	show()

func _on_continue_pressed():
	hide()
