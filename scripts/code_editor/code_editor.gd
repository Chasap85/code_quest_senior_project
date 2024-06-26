extends Control

const Utils = preload("res://scripts/utils.gd")
const COLOR_SETTINGS: Dictionary = {
	"number_color": "#6aa69c",
	"function_color": "#dcdcad",
	"symbol_color": "#fdd73a",
	"keyword_colors": {
		"def": "#5c9bd3",
		"True": "#5c9bd3",
		"False": "#5c9bd3",
		"not": "5c9bd3",
		"if": "#8a72b3",
		"elif": "#8a72b3",
		"else": "#8a72b3"
	},
	"color_regions": {
		"'": "#d5ba82",
		"#": "#108b2d",
		"\"": "#cb814e"
	}
}

#region Reference Variables (Nodes)
@onready var data_handler: Node = $"../DataHandler"
@onready var code_text_box: CodeEdit = $EditorContainer/CodeEdit
@onready var code_verifier: Node = $EditorContainer/CodeVerifier
@onready var feedback_handler: Node = $EditorContainer/CodeVerifier/FeedbackHandler
#endregion

var challenge_data: Utils.ChallengeData

func _ready() -> void:
	_configure_editor()
	challenge_data = Utils.ChallengeData.new()

func _on_submit_pressed() -> void:
	code_verifier.send_code_for_evaluation(code_text_box.text)
	
func update_section_data(challenge_data: Utils.ChallengeData):
	challenge_data = challenge_data
	code_text_box.set_text(challenge_data.starter_code)
	code_verifier.set_expected_output(challenge_data.expected_output)
	feedback_handler.update_data(challenge_data)

#region Code Editor Text Box Setup
func _configure_editor() -> void:
	code_text_box.set_draw_line_numbers(true)
	code_text_box.set_auto_indent_enabled(true)
	code_text_box.set_auto_brace_completion_enabled(true)
	code_text_box.syntax_highlighter = _create_code_highlighter()

func _create_code_highlighter() -> CodeHighlighter:
	var code_highlighter: CodeHighlighter = CodeHighlighter.new()
	code_highlighter.number_color = COLOR_SETTINGS["number_color"]
	code_highlighter.function_color = COLOR_SETTINGS["function_color"]
	code_highlighter.symbol_color = COLOR_SETTINGS["symbol_color"]
	code_highlighter.member_variable_color = COLOR_SETTINGS["function_color"]
	code_highlighter.keyword_colors = COLOR_SETTINGS["keyword_colors"]
	code_highlighter.color_regions = COLOR_SETTINGS["color_regions"]
	return code_highlighter
#endregion
