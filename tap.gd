extends Sprite
export var tapTime = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var globals = get_node("../../globals")
var missedSignalSent = false
signal missedTap
signal lateTap
signal earlyTap

# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("missedTap", get_node("../../globals"), "tapMissed")
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var timeDifference = (globals.time - tapTime)
	self.position.y = timeDifference * globals.timeToPixel

	if timeDifference > 1.0 :
		self.free()
	elif timeDifference > 0.5 and !missedSignalSent:
		emit_signal("missedTap")
		missedSignalSent = true
	elif timeDifference > 0.1:
		emit_signal("lateTap")
		#self.free()
	elif timeDifference > -0.05:
		#print("goodnigga")
		if globals.Apressed:
			self.free()
	elif timeDifference > -0.1:
		emit_signal("earlyTap")
	pass
