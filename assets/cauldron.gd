extends StaticBody2D


# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass

@onready var rich_text_label: RichTextLabel = $"../CanvasLayer/RichTextLabel"
var contents =[]
	
func test(ingredient: String, ref: Object):
	#print("received: ",ingredient)
	
	contents.append(ingredient)
	rich_text_label.text = str("Ingredients:\n", contents)
	print(contents)	
	ref.free() #delete the object

func polarToCartesian(theta: float, magnitude: int) -> Vector2:
	var x = magnitude * cos(theta)
	var y = magnitude * sin(theta)
	
	return Vector2(x,y)

#var orbit = 10
#func _process(delta: float) -> void:
	#polarToCartesian(0,orbit)
	#pass
