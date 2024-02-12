extends Node2D

func _on_ReturnToTitleButton_button_up():
	get_tree().change_scene("res://Scenes/TitleScreen.tscn");

func _on_ExitGameButton_button_up():
	get_tree().quit();
