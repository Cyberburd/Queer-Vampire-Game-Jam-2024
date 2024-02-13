extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	var dialogue = Dialogic.start("9.2-Traitor's Crown");
	add_child(dialogue);
