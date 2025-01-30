extends StaticBody2D


# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
@onready var origin: Node2D = $Origin
@onready var rich_text_label: RichTextLabel = $"../CanvasLayer/RichTextLabel"
const DISPLAY_INGREDIENT : String = ("res://scenes/display_ingredient.tscn")

const PLANT_TEXTURE_1 : String = ("res://assets/ingredient1.tres")
const PLANT_TEXTURE_2 : String = ("res://assets/ingredient2.tres")
const PLANT_TEXTURE_3 : String = ("res://assets/ingredient3.tres")

var displayIngredient
var contents = []
var displayed = []

var textures : Dictionary

func _ready() -> void:		
	await(self.ready)
	displayIngredient = load(DISPLAY_INGREDIENT)
	
	textures["red"] = load(PLANT_TEXTURE_1)
	textures["purple"] = load(PLANT_TEXTURE_2)
	textures["yellow"] = load(PLANT_TEXTURE_3)

func addIngredient(ingredient: String, ref: Object):
	#print("received: ",ingredient)
	
	contents.append(ingredient)
	
	var display :Sprite2D = displayIngredient.instantiate()
	var tex = textures[ingredient]
	display.texture = tex
	display.set_meta("ingredient",tex.get_meta("Type"))

	origin.add_child(display)
	
	displayed.append(display)
	
	rich_text_label.text = str("Ingredients:\n", contents)
	print(contents)	
	ref.free() #delete the object

func polarToCartesian(theta: float, magnitude: int) -> Vector2:
	var x = magnitude * cos(theta)
	var y = magnitude * sin(theta)
	
	return Vector2(x,y)

var orbit = 50
func _process(delta: float) -> void:
	if displayed.size() > 0:
		var offset = 360 / displayed.size()
		print(offset)
		var rotation = 0 - offset
		for i in displayed:
			rotation = rotation + offset	
			i.position = polarToCartesian(deg_to_rad(rotation),orbit)	
			i.global_rotation = 0
	#polarToCartesian(0,orbit)
	origin.rotate(deg_to_rad(1))
	pass
