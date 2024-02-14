extends CanvasLayer

func _ready():
	load_hearts()
	MazeGlobal.hud = self
	
func load_hearts():
	$Hearts.rect_size.x = MazeGlobal.lives * 32 #change 33 to wherever pixel size 
	$EmptyHearts.rect_size.x = (MazeGlobal.max_lives - MazeGlobal.lives) * 32
	$EmptyHearts.rect_position.x = 	$Hearts.rect_position.x + $Hearts.rect_size.x * $Hearts.rect_scale.x
