extends Node2D

export var FirstScene : PackedScene;
export var FinalScene : PackedScene;

func _on_NewGameButton_button_up():
	get_tree().change_scene_to(FirstScene);

func _on_CreditsButton_button_up():
	get_tree().change_scene_to(FinalScene);

func _on_ExitButton_button_up():
	get_tree().quit();
