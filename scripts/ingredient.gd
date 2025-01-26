extends Sprite2D


func popBubble() -> void:
	#run pop anim	
	#spawn ingredient
	queue_free() #despawn bubble
	
func launchItem() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
