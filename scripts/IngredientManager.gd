extends Node

var plantList = []
#"res://scenes/plant_2.tscn"
#var pipe = preload("path")
# Called when the node enters the scene tree for the first time.

const ENEMY_SCENE_PATH : String = ("res://scenes/plant_1.tscn")

func _ready() -> void:
	
	plantList.append(load("res://scenes/plant_1.tscn"))
	plantList.append(load("res://scenes/plant_2.tscn"))
	plantList.append(load("res://scenes/plant_3.tscn"))
	
	var p1 =plantList[randf_range(0,2)].instantiate()
	p1.position = Vector2(-72.0, 0.0)
	add_child(p1)

	print(str("hello from ", p1.name, " at ", p1.position))
		
	var GrassEffect = load("res://scenes/plant_1.tscn")
	var grassEffect = GrassEffect.instantiate()		
	grassEffect.position = Vector2(randf_range(-134.0, 134.0), randf_range(36.0, 44.0))
	#grassEffect.rotation = randf_range(-0.5, 0.5)
	#grassEffect.skew = randf_range(-0.5, 0.5)
	
	add_child(grassEffect)
	
	print(str("hello from ", grassEffect.name, " at ", grassEffect.position))

	#var pipeInst = pipe.instance()
	#add_child(pipeInst)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
