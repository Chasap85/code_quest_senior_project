extends AnimatedSprite2D

@onready var lessonPlayer := $LessonAnimationPlayer

var infoLevel1 = [0, 1, 2, 3, 4, 5, 6, 7, 8]
var count
# Called when the node enters the scene tree for the first time.
func _ready():
	var scene = get_tree().current_scene.name
	match scene:
		"Level1":
			count = 0
		"Level2":
			count = 3
		"Level3":
			count = 6

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func getInfo():
	print('get info')
	set_frame(count)
	count += 1
