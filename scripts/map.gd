extends Sprite2D

@onready var animate = $MapPopupAnimation

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()

func _start_map_popup():
	animate.play("map_popup")
