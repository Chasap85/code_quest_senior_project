extends Node2D

@onready var dialogue = $DialogueBalloon
@onready var infoBox = $InfoBox
@onready var ciea = $Ciea
@onready var codeEdit = $"Control-editor"
@onready var codePrompt = $CodePrompt
@onready var dataHandler = $DataHandler
@onready var apple = $Apple
@onready var apple2 = $Apple2
@onready var apple3 = $Apple3

@onready var transition = $TransitionScene

signal start_challenge

func _ready():
	dialogue.hide()
	await ciea.animation_looped
	dialogue.show()
	dataHandler._on_path_received("res://assets/level-data/level_1_data.json")

func _on_back_pressed():
	get_tree().change_scene_to_file("res://level-scenes/menu.tscn")

# next level
	# _transition.transition_to("Path to next scene")

func _on_dialogue_start_challenge():
	var apples = [apple, apple2, apple3]
	for each in apples:
		each.show()
	codeEdit.show()
	codePrompt.show()
	

func _on_dialogue_balloon_hide_info():
	infoBox.hide()
