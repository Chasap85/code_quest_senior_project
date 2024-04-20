extends Node2D

@onready var dialogue = $DialogueBalloon
@onready var infoBox = $InfoBox
@onready var ciea = $Ciea
@onready var codeEdit = $"Control-editor"
@onready var codePrompt = $CodePrompt
@onready var animation_handler = $AnimationHandler
@onready var data_handler = $DataHandler
@onready var animation_node_1 = $AnimationNode1
@onready var animation_node_2 = $AnimationNode2
@onready var apple = $Apple
@onready var apple2 = $Apple2
@onready var apple3 = $Apple3

@onready var transition = $TransitionScene

@onready var testNode = $Node
signal start_challenge

# Initial Ciea Intro moved to $AnimationNode1 and $Ciea for demo
# TODO: Refactor so introduction starts here, rest of animations handled by AnimationNodes
func _ready():
	#dialogue.hide()
	#await ciea.animation_looped
	#dialogue.show()
	animation_handler._set_animation_list([animation_node_1, animation_node_2])
	animation_handler._play_current_animation()
	data_handler.load_level_data("res://assets/level-data/level_1_data.json")

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
	

#func _on_dialogue_balloon_hide_info():
	#infoBox.hide()
