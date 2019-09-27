extends Node2D

export var Apressed = false;
export var Spressed = false;
export var Dpressed = false;
export var Fpressed = false;
var Atapped = false;
var Stapped = false;
var Dtapped = false;
var Ftapped = false;
export var time = 0;
export var paused = false;
export var missedTap = false;
export var timeToPixel = 500.0

export var earlyFitTime = 0.1
export var lateFitTime = 0.1
export var earlyTime = 0.2
export var lateTime = 0.2

var points = 0.0
signal A_tapped
signal S_tapped
signal D_tapped
signal F_tapped
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
		_tapDetect()
	pass

func _tapDetect():
	if Apressed and !Atapped:
		emit_signal("A_tapped")
		Atapped = true
	if !Apressed:
		Atapped = false
	
	if Spressed and !Stapped:
		emit_signal("S_tapped")
		Stapped = true
	if !Spressed:
		Stapped = false
	
	if Dpressed and !Dtapped:
		emit_signal("D_tapped")
		Dtapped = true
	if !Dpressed:
		Dtapped = false
		
	if Fpressed and !Ftapped:
		emit_signal("F_tapped")
		Ftapped = true
	if !Fpressed:
		Ftapped = false
		
func _updatePoints(var deltaPoints = 0.0):
	points+=deltaPoints
	$"../Control/RichTextLabel".text = str(points)
