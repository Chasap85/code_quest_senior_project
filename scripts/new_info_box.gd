extends CanvasLayer

@onready var lessonPlayer := $LessonAnimationPlayer

var infoLevel1 = [0, 1, 2]
var count = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	#hide()
	lessonPlayer.play("info")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == MOUSE_BUTTON_LEFT \
	and event.pressed:
		_on_dialogue_balloon_show_info()
		
func _on_dialogue_balloon_show_info():
	var info = getInfo(infoLevel1)
	show()

func getInfo(info):
	var correctInfo = info[count]
	lessonPlayer.set_frame("info", count)
	#set_frame( StringName anim, int idx, Texture2D texture, float duration=1.0 )
	count += 1
	return correctInfo
