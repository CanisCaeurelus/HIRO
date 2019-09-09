extends Node2D

export var Apressed = false;
export var Spressed = false;
export var Dpressed = false;
export var Fpressed = false;
export var time = 0;
export var paused = false;
export var missedTap = false;
export var timeToPixel = 500.0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !paused:
		time+=delta
	pass

func tapMissed():
	$"../Control/tapMissedSound".play()
	print("yolo")
	
