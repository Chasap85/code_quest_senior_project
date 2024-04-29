extends Node

const Utils = preload("res://scripts/utils.gd")

@onready var utils = Utils.new()
@onready var dialogue = $DialogueBalloon
@onready var infoBox = $InfoBox
@onready var charles = $CharlesBandaidSectionP3
@onready var healthy_bear = $HealthyBear
@onready var healthy_bear_name = $HealthyBear/Name
@onready var medicine_bag = $MedicineBag


func _ready():
	charles.hide()
	healthy_bear.hide()
	medicine_bag.hide()
	healthy_bear_name.set_text(
		utils.load_file_as_string('res://assets/level2/bear_name.txt')
	)

func _start_animation():
	healthy_bear.show()
	medicine_bag.show()
	charles._start_charles_animation()
	await charles.animation_looped

func _on_dialogue_balloon_hide_info():
	infoBox.hide()
