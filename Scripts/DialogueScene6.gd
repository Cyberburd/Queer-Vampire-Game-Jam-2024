extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	var dialogue = Dialogic.start('6-Chomp');
	add_child(dialogue);
