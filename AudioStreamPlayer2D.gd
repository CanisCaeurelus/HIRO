extends AudioStreamPlayer2D
onready var globals = get_node("../../globals")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if globals.Apressed:
		pitch_scale = 0.75
	elif globals.Spressed:
		pitch_scale = 0.9
	elif globals.Dpressed:
		pitch_scale = 1.1
	elif globals.Fpressed:
		pitch_scale = 1.5
	else:
		pitch_scale = 1.0
	pass
