extends Sprite

export var modulation = Color(1.0,0.0,0.0);
export var key = "A"
export var tapArray = [1, 2.0, 1.5, 2.0,0,0,0,0,0,0,0,0,0,0]
onready var globals = get_node("../globals")
var Apressed = false
var Spressed = false
var Dpressed = false
var Fpressed = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	self.modulate = modulation
	var tapScene = load("res://tap.tscn")
	for tapTime in tapArray:
		if(tapTime):
			var tapNode = tapScene.instance()
			tapNode.tapTime = tapTime
			self.add_child(tapNode)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var pressed = false
	if ("A" == key or "a" == key):
		pressed = globals.Apressed 
	elif ("S" == key or "s" == key):
		pressed = globals.Spressed 
	elif ("D" == key or "d" == key):
		pressed = globals.Dpressed 
	elif ("F" == key or "f" == key):
		pressed = globals.Fpressed 
	if pressed:
		self.self_modulate = modulation
	else:
		self.self_modulate = modulation / 2
		
	get_node("string").offset.y += delta * globals.timeToPixel / 5.0
	if(get_node("string").offset.y >= 500.0 ):
		get_node("string").offset.y = 250
	pass
