extends AnimatedSprite2D

signal hide_dialogue
@onready var animate := $WizardAnim

func _ready():
	hide()

func _start_whiteWizard_animation():
	show()
	animate.play("ciea-enters")
	await animate.animation_finished
	play("wizardHand")

func _on_dialogue_balloon_show_wizard():
	_start_whiteWizard_animation()

func _on_dialogue_balloon_hide_wizard():
	animate.play_backwards("ciea-enters")
	emit_signal("hide_dialogue")
	
