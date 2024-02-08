extends KinematicBody2D

var speed = 280
var audio_player
var lives_remaining = 3

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
	audio_player.stop()
	if Input.is_action_pressed("ui_right"):
		velocity.x = 1
		audio_player.play()
	if Input.is_action_pressed("ui_left"):
		velocity.x = -1
		audio_player.play()
	if Input.is_action_pressed("ui_up"):
		velocity.y = -1
	if Input.is_action_pressed("ui_down"):
		velocity.y = 1
		audio_player.play()
	velocity = velocity.normalized()
	move_and_slide(velocity * speed)

func _on_Body_entered(body):
	# Check if the body entered is a bomb
	if body.name == "Bomb":
		# Remove one life from the player
		remove_life_from_player()

func remove_life_from_player():
	# Check if player has remaining lives
	if lives_remaining > 0:
		# Reduce one life
		lives_remaining -= 1
		# You can implement further logic here, such as updating UI to reflect lives remaining
	else:
		# Game Over logic can be implemented here
		pass
