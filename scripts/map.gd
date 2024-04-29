extends Sprite2D

@onready var animate = $MapPopupAnimation
@onready var animate_pings = $Pings/PingAnimationPlayer
@onready var map = $"."

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()

func _start_pings_popup():
	animate_pings.play("pings")

func _start_pings_exit():
	animate_pings.play_backwards("pings")

func _start_map_popup():
	show()
	animate.play("map_popup")

func _on_dialogue_balloon_map_popup():
	show()
	animate.play("map_popup")
