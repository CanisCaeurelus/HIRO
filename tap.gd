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
var selfDestroy = false
# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("missedTap", get_node("../../globals"), "tapMissed")
	match get_parent().key:
		"A","a":
			get_node("../../globals").connect("A_tapped", self, "_tapHit")
		"S","s":
			get_node("../../globals").connect("S_tapped", self, "_tapHit")
		"D","d":
			get_node("../../globals").connect("D_tapped", self, "_tapHit")
		"F","f":
			get_node("../../globals").connect("F_tapped", self, "_tapHit")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var timeDifference = (globals.time - tapTime)
	self.position.y = timeDifference * globals.timeToPixel
	var freeFlag = false
	if timeDifference > 1.0 :
		selfDestroy = true
	elif timeDifference > 0.5 and !missedSignalSent:
		emit_signal("missedTap")
		missedSignalSent = true
	
	if selfDestroy:
		self.free()
	pass

func _tapHit():
	var timeDifference = (globals.time - tapTime)
	if !(timeDifference > 0.1) and timeDifference > 0.05:
		emit_signal("lateTap")
		selfDestroy = true
	elif timeDifference > -0.05:
		selfDestroy = true
	elif timeDifference > -0.1:
		emit_signal("earlyTap")
		selfDestroy = true


