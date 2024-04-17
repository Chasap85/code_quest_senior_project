extends Control

@onready var text_edit_node = $TextEdit

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func set_new_code_task(task_text: String) -> void:
	text_edit_node.set_text(task_text)
