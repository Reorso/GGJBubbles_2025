extends Node2D

func spawn(obj: CharacterBody2D):
	#print("spawner pos", self.global_position, " name ", self.name)
		#print ("obj pos", obj.position)

	
	add_child(obj)
	obj.global_position = self.global_position
