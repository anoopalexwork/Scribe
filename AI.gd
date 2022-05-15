extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text
export var rows = 5
export var cols = 5
var text=""
var lastx
var lasty
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func show():
	print(text+" "+String(lastx)+" "+String(lasty))
	# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
