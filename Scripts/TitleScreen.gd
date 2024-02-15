extends Node2D

export var FirstScene : PackedScene;
export var FinalScene : PackedScene;

func _on_NewGameButton_button_up():
	get_tree().change_scene_to(FirstScene);
	print("reloaded lives")
	MazeGlobal.lives = MazeGlobal.max_lives

func _on_CreditsButton2_button_up():
	get_tree().change_scene_to(FinalScene);

func _on_ExitButton_button_up():
	get_tree().quit();

