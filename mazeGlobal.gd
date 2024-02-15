extends Node

var max_lives = 3
var lives = max_lives
var hud

func lose_life():
	lives -= 1
	hud.load_hearts()
	
	if lives <= 0:
		print("Player has no more lives. Loading title screen...")
		# Ensure the path to the title screen scene is correct
		var gameOver_path = "res://Scenes/GameOver.tscn"
		# Check if the title screen scene exists
		if ResourceLoader.exists(gameOver_path):
			# Change the scene to the title screen
			get_tree().change_scene(gameOver_path)
		else:
			# Print an error message if the title screen scene does not exist
			print("Error: Title screen scene not found at path:", gameOver_path)
	else:
		print("Player has lives remaining:", lives)
