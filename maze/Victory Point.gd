extends Area2D

export var sceneToLoad : PackedScene
export var narrativeVarToSet : String

func _on_Victory_Point_body_entered(body):
	if body.name == "Player":
		if MazeGlobal.lives > 0:
			print("loaded next level")
			print("lives reset")
			MazeGlobal.lives = MazeGlobal.max_lives
			Dialogic.set_variable(narrativeVarToSet, "true")
			get_tree().change_scene_to(sceneToLoad);
	else:
		print("Player has no lives remaining")
		print("next level not loaded")
