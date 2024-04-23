extends AnimatedSprite2D

@onready var lessonPlayer := $LessonAnimationPlayer

var infoLevel1 = [0, 1, 2, 3, 4, 5]
var count
# Called when the node enters the scene tree for the first time.
func _ready():
	if get_tree().current_scene.name == "Level1":
		count = 0
	else:
		count = 3


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func getInfo():
	set_frame(count)
	count += 1
