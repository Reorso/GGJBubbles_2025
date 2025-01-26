extends CharacterBody2D

var velocity2 = Vector2(50,50)

func _process(delta: float) -> void:
	var collision_info = move_and_collide(velocity2 * delta)
	if collision_info:
		velocity2 = velocity2.bounce(collision_info.get_normal())
