extends Control

var code_edit
# Called when the node enters the scene tree for the first time.
func _ready():
	code_edit = $CodeEdit
	
func _on_button_pressed():
	print('helloooo')


func _on_text_changed():
	var new_text = code_edit.text
	print(new_text)
