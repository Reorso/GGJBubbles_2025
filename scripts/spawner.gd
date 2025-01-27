extends Node2D

func spawn(obj: CharacterBody2D):
	print("spawner pos", self.global_position, " name ", self.name)
	obj.position = self.position
	add_child(obj)
