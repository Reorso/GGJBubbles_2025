extends Node

var textures = []

const PLANT_TEXTURE_1 : String = ("res://assets/ingredient1.tres")
const PLANT_TEXTURE_2 : String = ("res://assets/ingredient2.tres")
const PLANT_TEXTURE_3 : String = ("res://assets/ingredient3.tres")

const PLANT_ASSET : String = ("res://scenes/ingredient.tscn")

var plantAsset = load(PLANT_ASSET)
var weightings : Dictionary

var activeIngredients : Dictionary

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
	#print(texture)
	
	var p1 = plantAsset.instantiate()
	p1.position = Vector2(randf_range(-130.0, 72), randf_range(-46, 36.0))
	p1.get_node("Plant1").texture = texture
	p1.set_meta("ingredient",texture.get_meta("Type"))
	#print(texture.get_meta("Type"))

	add_child(p1)
	activeIngredients[p1.name] = texture.get_meta("Type")
	p1.register(self) #give it reference to this object so it can tell us when deleted
	print("activeIngredients after register:", activeIngredients)

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
	#print(str("boundaries=",weightBoundaries))
	#print(str("roll=", roll))

	for key in weightBoundaries:
		if roll <= weightBoundaries[key]:
			return key
			
	return	null;
	
func unregister(ref: Object):
	print("unregistering '", ref.name, "'")
	activeIngredients.erase(ref.name)
	print("activeIngredients after unregister:", activeIngredients)
