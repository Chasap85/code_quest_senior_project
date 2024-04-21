extends CanvasLayer

@onready var animate = $AnimationPlayer
@onready var lesson = $PanelContainer/Lessons

var infoLevel1 = ["Info1", "Info2", "Info3"]
# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_dialogue_balloon_show_info():
	lesson.getInfo()
	show()
