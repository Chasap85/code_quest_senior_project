extends AnimatedSprite2D

@onready var lessonPlayer := $LessonAnimationPlayer

var infoLevel1 = [0, 1, 2]
var count = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	#hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func getInfo():
	set_frame(count)
	count += 1
