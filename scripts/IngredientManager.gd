extends Node

var textures = []

const PLANT_TEXTURE_1 : String = ("res://assets/ingredient1.tres")
const PLANT_TEXTURE_2 : String = ("res://assets/ingredient2.tres")
const PLANT_TEXTURE_3 : String = ("res://assets/ingredient3.tres")

const PLANT_ASSET : String = ("res://scenes/plant_1.tscn")

var plantAsset = load(PLANT_ASSET)
var weightings : Dictionary

func _ready() -> void:
	textures.append(load(PLANT_TEXTURE_1))
	textures.append(load(PLANT_TEXTURE_2))
	textures.append(load(PLANT_TEXTURE_3))
	
	for thing in textures:
		weightings[thing] = thing.get_meta("SpawnWeighting")
		print(str("SpawnWeighting=", thing.get_meta("SpawnWeighting")))
	
	spawnIngredient()
	spawnIngredient()
	spawnIngredient()

func spawnIngredient()-> void:
	var texture = pickTexture()
	print(texture)
	
	var p1 = plantAsset.instantiate()
	p1.position = Vector2(randf_range(-134.0, 134.0), randf_range(36.0, 44.0))
	p1.get_node("Plant1").texture = texture

	add_child(p1)

func pickTexture()-> AtlasTexture:
	var total : int
	for key in weightings:
		total += weightings[key]
			
	var roll = randi_range(0, total)
	
	var runningTotal = 0
	var weightBoundaries : Dictionary
	
	for key in weightings:		
		weightBoundaries[key] = weightings[key] + runningTotal 
		runningTotal += weightBoundaries[key]
	print(str("boundaries=",weightBoundaries))
	print(str("roll=", roll))

	for key in weightBoundaries:
		if roll <= weightBoundaries[key]:
			return key
			
	return	null;	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
