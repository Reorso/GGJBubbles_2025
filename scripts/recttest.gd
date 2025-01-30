extends CollisionShape2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#print("position",self.shape.get_rect().position);
	#print("end",self.shape.get_rect().end);
	#
	#var topLeftlocal=	self.shape.get_rect().position
	#var centre = self.transform.origin
	#
	#print("x",self.transform.x," y",self.transform.y)
	#print("global",self.global_position) 
	#
	var topleftrealy = self.global_position.y - (0.5 * self.shape.get_rect().size.y) 
	var topleftrealx = self.global_position.x - (0.5 * self.shape.get_rect().size.x)
	print("x",topleftrealx," y",topleftrealy)
	
	topleftrealy = self.global_position.y + (0.5 * self.shape.get_rect().size.y) 
	topleftrealx = self.global_position.x + (0.5 * self.shape.get_rect().size.x)
	print("bottom right x",topleftrealx," y",topleftrealy)

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
