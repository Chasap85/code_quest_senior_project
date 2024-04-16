extends Node2D

@onready var code_editor = $"../CodeEditorNode"
@onready var feedback_box = $PopupContainer/FeedbackBox

func _ready():
	code_editor.answer_declined.connect(_on_answer_declined)

func _on_answer_declined():
	# TODO: Connect feedback thru PopupHandler and Feedback Handler
	# feedback_box.set_text()
	show()

func _on_continue_pressed():
	hide()
