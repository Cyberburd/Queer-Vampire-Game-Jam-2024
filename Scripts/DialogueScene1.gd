extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	var dialogue = Dialogic.start('1-Radio Transmission');
	add_child(dialogue);
