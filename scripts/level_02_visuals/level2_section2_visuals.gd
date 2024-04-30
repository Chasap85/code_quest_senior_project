extends Node

const Utils = preload("res://scripts/utils.gd")

@onready var utils = Utils.new()
@onready var dialogue = $DialogueBalloon
@onready var infoBox = $InfoBox
@onready var charles = $CharlesBandaidSection
@onready var medicine_bag = $MedicineBag
@onready var sick_bear = $SickBear
@onready var sick_bear_name = $SickBear/Name



func _ready():
	charles.hide()
	sick_bear.hide()
	medicine_bag.hide()
	sick_bear_name.set_text(
		utils.load_file_as_string('res://assets/level2/bear_name.txt')
	)

func _start_animation():
	print("anim_2")
	sick_bear.show()
	sick_bear_name.show()
	medicine_bag.show()
	charles._start_charles_animation()
	await charles.animation_looped

func _on_dialogue_balloon_hide_info():
	infoBox.hide()
