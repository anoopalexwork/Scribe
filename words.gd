extends Node
enum {TXT,R,C,COL}

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var list=[]
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func addword(txt,r,c,dir):
	list.append([txt,r,c,dir])
	#print(list)

func getword(r,c):
	for word in list:
#		if (not word[COL]):
		print("%s %s %s"%[word[TXT],word[R],word[C]])
