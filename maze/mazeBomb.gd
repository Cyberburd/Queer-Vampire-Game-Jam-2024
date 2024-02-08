extends KinematicBody2D

# Exposed variables
export var explosionSound: AudioStream
#export var explosionAnimation: AnimationPlayer
export var explosionDistance: float = 50
export var damageAmount: int = 1

var player
var hasExploded = false

func _ready():
	# Connect to the player's signal
	player = get_node("/root/Player")
	#player.connect("position_changed", self, "_on_player_position_changed")

func _on_player_position_changed():
	if !hasExploded:
		# Calculate distance to player
		var distanceToPlayer = position.distance_to(player.position)

		# Check if player is close enough to trigger explosion
		if distanceToPlayer < explosionDistance:
			# Play explosion sound
			if explosionSound:
				AudioServer.play(get_node_or_null("../../../Sound"), explosionSound)
			
			# Show explosion animation
			#if explosionAnimation:
				#explosionAnimation.play("explode")
			
			# Reduce player's life
			player.take_damage(damageAmount)
			
			# Mark the bomb as exploded
			hasExploded = true
