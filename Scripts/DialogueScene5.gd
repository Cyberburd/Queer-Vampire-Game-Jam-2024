extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	var dialogue = Dialogic.start('5-jail part 2');
	add_child(dialogue);
