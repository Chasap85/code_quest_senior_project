extends Control

signal codeTextSignal(text: String)
signal answer_accepted()

@onready var data_handler = $"../DataHandler"
@onready var code_edit = $EditorContainer/CodeEdit as CodeEdit
@onready var code_handler = get_node("EditorContainer/CodeHandler")
@onready var feedback_handler = $EditorContainer/CodeHandler/FeedbackHandler

var number_color = "#6aa69c"
var function_color = "#dcdcad"
var symbol_color = "#fdd73a"
var keyword_colors = {"def": "#5c9bd3",
					"True" : "#5c9bd3", 
					"False" : "#5c9bd3",
					"not" : "5c9bd3",
					"if" : "#8a72b3",
					"elif" : "#8a72b3",
					"else" : "#8a72b3"}
var color_regions = {"'" : "#d5ba82",
					"#" : "#108b2d",
					"\"" : "#cb814e"}

# Called when the node enters the scene tree for the first time.
func _ready():
	_configure_editor()
	data_handler.code_edit_update.connect(_on_emitted_editor_contents)

func _configure_editor():
	code_edit.set_draw_line_numbers(true)
	code_edit.set_auto_indent_enabled(true)
	code_edit.set_auto_brace_completion_enabled(true)
	code_edit.syntax_highlighter = _gen_code_highlighter()

func _gen_code_highlighter():
	var code_highlighter = CodeHighlighter.new()
	code_highlighter.number_color = number_color
	code_highlighter.function_color = function_color
	code_highlighter.symbol_color = symbol_color
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

func _on_emitted_editor_contents(new_text, new_output):
	code_edit.set_text(new_text)
	code_handler._set_expected_output(new_output)

func _emit_accepted_status():
	answer_accepted.emit()

# Debug Function
func _on_text_changed():
	var new_text = code_edit.text
	print(new_text)
	

