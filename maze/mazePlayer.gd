extends KinematicBody2D

var movement_speed = 320
var audio_player
var is_moving = false
onready var animation = $Sprite
signal life_changed(player_hearts)

func _ready():
	# Create an instance of AudioStreamPlayer
	audio_player = AudioStreamPlayer.new()
	# Add it to the scene
	add_child(audio_player)
	# Load the audio file
	var audio_stream = load("res://Sound/SFX/running2.mp3")
	# Set the audio stream to the player
	audio_player.stream = audio_stream

func _physics_process(delta):
	var velocity = Vector2()

	if Input.is_action_pressed("ui_right"):
		velocity.x = 1
		animation.play("right")
		is_moving = true
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -1
		animation.play("left")
		is_moving = true
	elif Input.is_action_pressed("ui_up"):
		velocity.y = -1
		animation.play("up")
		is_moving = true
	elif Input.is_action_pressed("ui_down"):
		velocity.y = 1
		animation.play("down")
		is_moving = true
	else:
		is_moving = false

	if is_moving:
		# Normalize velocity if moving diagonally
		if velocity.length_squared() > 0:
			velocity = velocity.normalized()
		# Play audio only if player is moving
		if not audio_player.is_playing():
			audio_player.play()
	else:
		# If no movement keys are pressed, play the neutral animation
		animation.play("neutral")
		# Stop audio if player is not moving
		audio_player.stop()

	move_and_slide(velocity * movement_speed)

func ouch(var enemyposx):
	MazeGlobal.lose_life()
	
func _on_Player_screen_exited():
	# Check if the player has lives remaining
	if MazeGlobal.lives > 0:
		var current_level = int(get_tree().current_scene.name)
		var next_level_path = "res://maze/mazeLevels/Level" + str(current_level + 1) + ".tscn"
		print("reloaded lives")
		MazeGlobal.lives = MazeGlobal.max_lives
		print("Attempting to load next level:", next_level_path)
		
		if ResourceLoader.exists(next_level_path):
			var result = get_tree().change_scene(next_level_path)
			if result != OK:
				print("Error loading next level:", next_level_path)
				print("Error code:", result)
		else:
			print("Next level not found:", next_level_path)
	else:
		print("Player has no lives remaining. Next level will not be loaded.")
