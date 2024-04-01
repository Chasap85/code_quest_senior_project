extends Control

signal codeTextSignal(text: String)

@onready var code_edit = $EditorContainer/CodeEdit as CodeEdit
@onready var code_handler = get_node("EditorContainer/CodeHandler")

var number_color = "#6aa69c"
var function_color = "#bb8650"
var symbol_color = "#4a7efb"
var keyword_colors = {"def": "#3a3eff",
					"True" : "#3a3eff", 
					"False" : "#3a3eff",
					"not" : "3a3eff",
					"if" : "#be29e1",
					"elif" : "#be29e1",
					"else" : "#be29e1"}
var color_regions = {"'" : "#f55b41",
					"#" : "#108b2d"}

# Called when the node enters the scene tree for the first time.
func _ready():
	_configure_editor()

func _configure_editor():
	code_edit.set_auto_indent_enabled(true)
	code_edit.set_auto_brace_completion_enabled(true)
	code_edit.syntax_highlighter = _gen_code_highlighter()

func _gen_code_highlighter():
	var code_highlighter = CodeHighlighter.new()
	code_highlighter.number_color = number_color
	code_highlighter.function_color = function_color
	code_highlighter.member_variable_color = function_color
	code_highlighter.keyword_colors = keyword_colors
	code_highlighter.color_regions = color_regions
	return code_highlighter

func _on_submit_pressed():
	# Send User's code to CodeHandler Node
	print("Sending signal") # Debug statement
	var text = code_edit.text
	codeTextSignal.emit(text)
	code_handler._on_code_received(text)

# Debug Function
func _on_text_changed():
	var new_text = code_edit.text
	print(new_text)
