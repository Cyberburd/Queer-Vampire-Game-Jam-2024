extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	var dialogue = Dialogic.start('8-Hangover');
	add_child(dialogue);
