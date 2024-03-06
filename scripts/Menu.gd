extends Control

func _on_play_pressed():
	get_tree().change_scene_to_file("res://level-scenes/level-cyberpunk_club.tscn")


func _on_options_pressed():
	get_tree().change_scene_to_file("res://level-scenes/options.tscn")


func _on_quit_pressed():
	get_tree().quit()
