extends CharacterBody2D

var velocity2 = Vector2(50,50)
var controllerReference : Object

func _process(delta: float) -> void:
	var collision_info = move_and_collide(velocity2 * delta)
	if collision_info:
		velocity2 = velocity2.bounce(collision_info.get_normal())
		
		var objectRef :Object = collision_info.get_collider()
		if objectRef.is_class("StaticBody2D"):
			#print("hit static")

			#var sb2d: StaticBody2D = objectRef;
			if objectRef.name == "Cauldron":
				#print("calling cauldron")
				#var cauldronScript = sb2d.get_script()
				#print("script ='", objectRef, "'")
				objectRef.test(self.get_meta("ingredient"), self)

func register(controllerRef: Object):
	controllerReference = controllerRef
	
func _notification(what):
	if (what == NOTIFICATION_PREDELETE):
		#print("unregistering: " +self.name)
		controllerReference.unregister(self)
