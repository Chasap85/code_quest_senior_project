extends Node

@onready var dialogue = $Dialogue
@onready var infoBox = $InfoBox
@onready var bytebeard = $Bytebeard

@onready var ship = $Ship
@onready var kraken = $Kraken
@onready var particles = $CPUParticles2D
@onready var water = $AnimationNodeWater/Water

func _ready():
	ship.hide()
	kraken.hide()
	particles.hide()
	water.hide()
	pass

func _start_animation():
	ship.show()
	kraken.show()
	particles.show()
	water.show()
	pass
