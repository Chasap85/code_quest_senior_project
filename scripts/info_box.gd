extends CanvasLayer

@onready var animate = $AnimationPlayer
@onready var lesson = $PanelContainer/Lessons

var infoLevel1 = ["Info1", "Info2", "Info3"]
# Called when the node enters the scene tree for the first time.
func _ready():
	hide()

func _on_dialogue_balloon_show_info():
	lesson.getInfo()
	print("SHOW INFO")
	show()


func _on_dialogue_balloon_hide_info():
	hide()
