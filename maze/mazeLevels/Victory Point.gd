extends Area2D

export var sceneToLoad : PackedScene
export var narrativeVarToSet : String

func OnWin():
	Dialogic.set_variable(narrativeVarToSet, "true")
	get_tree().change_scene_to(sceneToLoad);
