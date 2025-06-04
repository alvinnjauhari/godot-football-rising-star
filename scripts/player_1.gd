extends CharacterBody2D  # Use CharacterBody2D for handling movement

# Speed of the player
var speed = 200

# Declare the AnimatedSprite2D node with @onready
@onready var animated_sprite = $AnimatedSprite2D

# Update function to move the player
func _process(delta):
	# Create a new velocity vector
	var move_direction = Vector2()

	# Check for input and set direction
	if Input.is_action_pressed("ui_right"):  # Right
		move_direction.x += 1
		animated_sprite.flip_h = false  # Face right
	elif Input.is_action_pressed("ui_left"):  # Left
		move_direction.x -= 1
		animated_sprite.flip_h = true  # Face left

	if Input.is_action_pressed("ui_up"):  # Up
		move_direction.y -= 1
	elif Input.is_action_pressed("ui_down"):  # Down
		move_direction.y += 1

	# Normalize the direction vector to avoid faster movement diagonally
	if move_direction.length() > 0:
		move_direction = move_direction.normalized() * speed

	# Update the velocity of the CharacterBody2D
	velocity = move_direction

	# Move the character using the built-in method
	move_and_slide()

	# Set the animation based on movement direction
	if velocity.length() > 0:
		animated_sprite.play("walking")  # Replace with your walking animation name
	else:
		animated_sprite.play("idle")  # Replace with your idle animation name
