extends Sprite2D

@onready var animate = $MapPopupAnimation

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()

func _on_dialogue_balloon_map_popup():
	show()
	animate.play("map_popup")
