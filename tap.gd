extends Sprite
export var tapTime = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var globals = get_node("../../globals")
var OTime

var missedSignalSent = false
var selfDestroy = false

signal lateTap
signal earlyTap
signal goodTap
signal missedTap

# Called when the node enters the scene tree for the first time.
func _ready():
	OTime= load("res://Time.gd").new(tapTime,globals)
	self.connect("lateTap", get_node("../../"), "_tapLate")
	self.connect("earlyTap", get_node("../../"), "_tapEarly")
	self.connect("goodTap", get_node("../../"), "_tapGood")
	self.connect("missedTap", get_node("../../"), "_tapMissed")
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
		emit_signal("missedTap")
		selfDestroy = true
	
	if selfDestroy:
		OTime.free()
		self.free()
	pass

func _tapHit():
	var timeDifference = (globals.time - tapTime)
	if OTime._isLate(globals.time):
		emit_signal("lateTap")
		selfDestroy = true
	elif OTime._isFitting(globals.time):
		emit_signal("goodTap",get_parent())
		selfDestroy = true
	elif OTime._isEarly(globals.time):
		emit_signal("earlyTap")
		selfDestroy = true
