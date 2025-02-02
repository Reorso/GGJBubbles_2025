extends CharacterBody2D

#var velocity2 = Vector2(0,50).rotated(transform.get_rotation()) #start with vector based on facing direction
#var velocity2 = transform.x * 5 #start with vector based on facing direction
#var velocity2 :Vector2 =Vector2(0,50).rotated(self.global_rotation)  #start with vector based on facing direction

var velocity2 
var speed = 50
var controllerReference : Object

@onready var plant: Sprite2D = $Plant1

func _ready() -> void:	
	await(self.ready)
	velocity2 =  Vector2(cos(self.global_rotation), sin(self.global_rotation)).rotated(deg_to_rad(-90))
	#print("global rot=", self.global_rotation)
	#print("vector", velocity2.angle())
	#var one = self.global_position+ Vector2(cos(self.global_rotation), sin(self.global_rotation))
	#draw_line(self.global_position, one*50.0, Color.RED, 2.0)

func _physics_process(delta: float) -> void:
	var collision_info = move_and_collide(velocity2 * delta)
	if collision_info:
		velocity2 = velocity2.bounce(collision_info.get_normal())
		
		var objectRef :Object = collision_info.get_collider()
		if objectRef is StaticBody2D:
			#print("hit static")

			#var sb2d: StaticBody2D = objectRef;
			if objectRef.name == "Cauldron":
				#print("calling cauldron")
				#var cauldronScript = sb2d.get_script()
				#print("script ='", objectRef, "'")
				objectRef.test(self.get_meta("ingredient"), self)
		if objectRef is CharacterBody2D:      # i hate this
			plant.reparent(self.get_parent())
#			animations
			queue_free()

func register(controllerRef: Object):
	controllerReference = controllerRef

func _notification(what):
	if (what == NOTIFICATION_PREDELETE):
		#print("unregistering: " +self.name)
		controllerReference.unregister(self)
