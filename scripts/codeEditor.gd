extends Control

signal codeTextSignal(text: String)

@onready var code_edit = $EditorContainer/CodeEdit as CodeEdit
@onready var code_handler = get_node("EditorContainer/CodeHandler")

# Called when the node enters the scene tree for the first time.
func _ready():
	code_edit.set_draw_tabs(true)
	code_edit.set_draw_line_numbers(true)
	code_edit.set_auto_indent_enabled(true)
	code_edit.set_auto_brace_completion_enabled(true)

func _on_submit_pressed():
	
	# Send User's code to CodeHandler Node
	print("Sending signal") # Debug statement
	var text = code_edit.text
	codeTextSignal.emit(text)
	code_handler._receive_code(text)

# Debug Function
func _on_text_changed():
	var new_text = code_edit.text
	print(new_text)
