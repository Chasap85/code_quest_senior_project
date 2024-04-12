extends Control

@onready var data_handler = $"../DataHandler"
@onready var code_prompt = $"./TextEdit"

# Called when the node enters the scene tree for the first time.
func _ready():
	data_handler.code_prompt_update.connect(on_emitted_task_prompt)

func on_emitted_task_prompt(new_text):
	code_prompt.set_text(new_text)

