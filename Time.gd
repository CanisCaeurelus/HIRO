extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var globals
var time = 0.0
func _init(time,eglobals):
	self.globals = eglobals
	self.time = time
func _isFitting(var time):
	print()
	if (self.time - globals.earlyFitTime < time) and (self.time + globals.lateFitTime > time ):
		return true
	return false

func _isEarly(var time):
	if (self.time - globals.earlyFitTime > time) and (self.time - globals.earlyTime < time ):
		return true
	return false

func _isLate(var time):
	if (self.time + globals.lateFitTime < time) and (self.time + globals.lateTime > time ):
		return true
	return false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
