extends CanvasLayer

@onready var lesson = $PanelContainer/Lessons

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()

func _on_dialogue_balloon_show_info():
	lesson.getInfo()
	show()


func _on_dialogue_balloon_hide_info():
	hide()


func _on_dialogue_show_info():
	lesson.getInfo()
	show()


func _on_dialogue_hide_info():
	hide()
