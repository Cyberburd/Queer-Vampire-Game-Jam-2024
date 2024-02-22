extends Node2D

export var FirstScene : PackedScene;
export var FinalScene : PackedScene;

func _on_NewGameButton_button_up():
	get_tree().change_scene_to(FirstScene);
	Dialogic.set_variable("Level1Flag", "false")
	Dialogic.set_variable("Level2Flag", "false")
	Dialogic.set_variable("Level3Flag", "false")
	Dialogic.set_variable("Level4Flag", "false")
	Dialogic.set_variable("Level5Flag", "false")
	Dialogic.set_variable("Level6Flag", "false")
	Dialogic.set_variable("FinalLevelFlag", "false")
	print("reloaded lives")
	MazeGlobal.lives = MazeGlobal.max_lives

func _on_CreditsButton2_button_up():
	get_tree().change_scene_to(FinalScene);

func _on_ExitButton_button_up():
	get_tree().quit();

