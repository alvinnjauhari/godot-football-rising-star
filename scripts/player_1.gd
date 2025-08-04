extends CharacterBody2D  # Use CharacterBody2D for handling movement

# Speed of the player
var speed = 300
var current_dir = "none"

# Declare the AnimatedSprite2D node with @onready
@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	player_movement(delta)
	
# Update function to move the player
func player_movement(delta):
	velocity = Vector2.ZERO

	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
		current_dir = "right"
	elif Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		current_dir = "left"

	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
		current_dir = "down"
	elif Input.is_action_pressed("ui_up"):
		velocity.y -= 1
		current_dir = "up"

	velocity = velocity.normalized() * speed
	move_and_slide()

	# Animasi
	if velocity.length() > 0:
		animated_sprite.play("walking")
	else:
		animated_sprite.play("idle")
