extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var scene = load("res://Scenes/DialogueScene.tscn").instance();
	scene.Timeline = "TestTimeline";
	get_tree().change_scene_to(scene);
