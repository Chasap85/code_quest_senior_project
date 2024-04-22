extends AnimatedSprite2D

@onready var animate = $SkillfulEnemyPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	animate.play("skillfulEnemy")
	play("walk")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
