extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var r
var c

onready var root = get_node("/root/Scribe")
onready var charInput = get_node("/root/Scribe/charInput")
onready var gb = get_node("/root/Scribe/gb")
# Called when the node enters the scene tree for the first time.
func _ready():
	connect("pressed",self,"onpress")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func onpress():
	charInput.input = self.text
#	#gb.found(charInput.skip.x,charInput.skip.y)
#	var j=((charInput.skip.x)*(27))+(charInput.skip.y)
#
#	#gb.setc(gb.getc(charInput.skip.x,charInput.skip.y),charInput.skip.x,charInput.skip.y)
#	print(charInput.input)
	charInput.hide()
