extends CharacterBody2D

@export var speed = 200
@export var friction = 0.5
@export var acceleration = 0.1

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var backBroom: Sprite2D = $Broom
@onready var lookTarget: Node2D = $Node2D
@onready var attackBroom: AnimationPlayer = $Node2D/Sprite2D/AnimationPlayer

var lockBroom = false


func get_input():
	var vertical = Input.get_axis("up", "down")
	var horizontal = Input.get_axis("left", "right")
	return Vector2(horizontal, vertical)

func _physics_process(delta):
	var direction = get_input()
	if direction.x > 0:
		animated_sprite_2d.flip_h = false;
		backBroom.flip_h = false;
	elif direction.x < 0:
		animated_sprite_2d.flip_h = true;
		backBroom.flip_h = true;
	if direction.length() > 0:
		velocity = velocity.lerp(direction.normalized() * speed, acceleration)
		animated_sprite_2d.play("Walk")
		transform.looking_at()
		animation_player.play("walking")
	else:
		velocity = velocity.lerp(Vector2.ZERO, friction)
		animation_player.play("RESET")
		animated_sprite_2d.play("Idle")
	move_and_slide()
	
func _process(delta):
	if !lockBroom:
			setTarget()

func _input(event):
	# Mouse in viewport coordinates.
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed == true:
			print(event.position)
			if !lockBroom:
				poke()
	# Print the size of the viewport.
	#print("Viewport Resolution is: ", get_viewport().get_visible_rect().size)

func setTarget():
	lookTarget.transform = lookTarget.transform.looking_at(get_local_mouse_position()).rotated_local(PI/2)
	
func poke():
	print('poking ', lockBroom)
	backBroom.visible = false
	lockBroom = true
	attackBroom.play('poke')

func endPoke():
	print('end poking ', lockBroom)
	backBroom.visible = true
	lockBroom = false
	
