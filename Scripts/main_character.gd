extends CharacterBody2D

@export var speed = 200
@export var friction = 0.5
@export var acceleration = 0.1

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func get_input():
	var vertical = Input.get_axis("up", "down")
	var horizontal = Input.get_axis("left", "right")
	return Vector2(horizontal, vertical)

func _physics_process(delta):
	var direction = get_input()
	
	if direction.x > 0:
		animated_sprite_2d.flip_h = false;
	elif direction.x < 0:
		animated_sprite_2d.flip_h = true;
		
	if direction.length() > 0:
		velocity = velocity.lerp(direction.normalized() * speed, acceleration)
		animated_sprite_2d.play("Walk")
	else:
		velocity = velocity.lerp(Vector2.ZERO, friction)
		animated_sprite_2d.play("Idle")
	move_and_slide()
	
func _process(delta):
	
	animated_sprite_2d
	pass
