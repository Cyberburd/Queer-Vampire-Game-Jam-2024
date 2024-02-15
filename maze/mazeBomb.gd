extends Area2D

var audio_player
onready var animation = $Sprite
var explosion_timer

func _ready():
	# Create an instance of AudioStreamPlayer
	audio_player = AudioStreamPlayer.new()
	# Add it to the scene
	add_child(audio_player)
	# Load the audio file
	var audio_stream = load("res://Sound/SFX/bombs.mp3")
	# Set the audio stream to the player
	audio_player.stream = audio_stream
	
	# Start with the standing animation
	animation.play("standing")
	
	# Create an instance of Timer
	explosion_timer = Timer.new()
	# Connect the timeout signal of the timer to a method to call when it expires
	explosion_timer.connect("timeout", self, "_on_explosion_timer_timeout")
	# Set the timer to expire after 1 second
	explosion_timer.wait_time = 1.9
	# Add the timer to the scene
	add_child(explosion_timer)

func _on_Bomb_body_entered(body):
	# Check if the body entering the collision area is the player
	if body.name == "Player":
		# Play explosion animation
		animation.play("explosion")
		# Play explosion sound
		audio_player.play()
		#take life 
		body.ouch(position.x)
		# Start the timer to wait for 1 second before freeing the bomb
		explosion_timer.start()

func _on_explosion_timer_timeout():
	# Free the bomb from the scene
	queue_free()
