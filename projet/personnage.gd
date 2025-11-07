extends CharacterBody2D

@export var speed = 10.0
@export var jump_power = 10.0
@onready var jumpsound: AudioStreamPlayer = $jumpsound

var speed_multiplier = 30.0 
var jump_multiplier = -30.0 
var direction = 0

#const SPEED = 300.0
#const JUMP_VELOCITY = -400.0
@onready var sprite_2d: AnimatedSprite2D = $Sprite2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta: float) -> void:
	# Animations
	if velocity.x > 1 or velocity.x < -1:
		sprite_2d.animation = "walk"
	else:
		sprite_2d.animation = "idle"
		
		
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		sprite_2d.animation = "jump"

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_power * jump_multiplier
		jumpsound.play()
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * speed * speed_multiplier
	else:
		velocity.x = move_toward(velocity.x, 0, speed * speed_multiplier)

	move_and_slide()
	
	var isLeft = velocity.x < 0
	sprite_2d.flip_h = isLeft
