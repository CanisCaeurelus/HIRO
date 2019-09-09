extends Node2D

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
		get_node("globals").Apressed = true 
	else:
		get_node("globals").Apressed = false
	if Input.is_key_pressed(KEY_S):
		get_node("globals").Spressed = true 
	else:
		get_node("globals").Spressed = false 
	if Input.is_key_pressed(KEY_D):
		get_node("globals").Dpressed = true 
	else:
		get_node("globals").Dpressed = false 
	if Input.is_key_pressed(KEY_F):
		get_node("globals").Fpressed = true 
	else:
		get_node("globals").Fpressed = false 

func _tapMissed():
	$"Control/tapMissedSound".play()

func _tapLate():
	$"Control/tapLateSound".play()
	
func _tapEarly():
	$"Control/tapEarlySound".play()
