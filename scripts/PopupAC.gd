extends Node2D

@onready var code_editor = $"../CodeEditorNode"

signal continue_next_section()

func _ready():
	code_editor.answer_accepted.connect(_on_answer_accepted)

func _on_answer_accepted():
	show()

func _on_continue_pressed():
	hide()
	continue_next_section.emit()
