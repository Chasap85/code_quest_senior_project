extends AnimatedSprite2D

# for animation player
@onready var animate := $CieaAnim

# for animation sprite sheet
@onready var animSprite := $Ciea

# Called when the node enters the scene tree for the first time.
func _ready():
	animate.play("ciea-enters")
	await animate.animation_finished
	play("ciea-eyes")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
