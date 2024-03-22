extends Control
@onready var code_edit = $VBoxContainer/CodeEdit as CodeEdit

# Called when the node enters the scene tree for the first time.
func _ready():
	code_edit.set_draw_tabs(true)
	code_edit.set_draw_line_numbers(true)
	code_edit.set_auto_indent_enabled(true)
	code_edit.set_auto_brace_completion_enabled(true)
	
func _on_button_pressed():
	print('helloooo')


func _on_text_changed():
	var new_text = code_edit.text
	print(new_text)
