extends Node2D
onready var globals = get_node("globals")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)   
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(ev):
	if Input.is_key_pressed(KEY_A):
		globals.Apressed = true 
	else:
		globals.Apressed = false
	if Input.is_key_pressed(KEY_S):
		globals.Spressed = true 
	else:
		globals.Spressed = false 
	if Input.is_key_pressed(KEY_D):
		globals.Dpressed = true 
	else:
		globals.Dpressed = false 
	if Input.is_key_pressed(KEY_F):
		globals.Fpressed = true 
	else:
		globals.Fpressed = false 

func _tapMissed():
	globals._updatePoints(-1.0)
	$"Control/tapMissedSound".play()
	
func _tapLate():
	$"Control/tapLateSound".play()
	
func _tapEarly():
	$"Control/tapEarlySound".play()

func _tapGood():
	globals._updatePoints(2.0)
	$"Control/tapGoodSound".play()