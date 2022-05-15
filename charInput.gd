extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var alpha = "abcdefghijklmnopqrstuvwxyz"
var iList
var letter
var fsx
var fsy
var v
var skip = Vector2()
var input
# Called when the node enters the scene tree for the first time.
func _ready():
	var posx=0
	var posy=0
	
#	for i in rows:
#		var letter = Button.new()
#
#		for j in cols:
#			gRow.append(letter)
#			gRow[j].show()
#		gBoard.append(gRow)
			
		
		
		
			 
	v = get_node("/root").get_viewport().size
	fsy = v.y / (15)
	fsx = v.x / 26
	var fsy=	fsx	#Preferable to keep >=18 but experiment
	var style = StyleBoxFlat.new()
	
	var charsize=1
	var wordsize
	var margin=20
	
	
	#set_position(Vector2(10,2))
	var f=DynamicFont.new()
	f.font_data=load("res://Xolonium-Regular.ttf")
	var glscript = load("getInput.gd")
	
	
	for i in alpha.length():
		letter =Button.new()
		letter.hide()
		letter.set("custom_fonts/font", f)
		letter.get("custom_fonts/font").set_size(int(fsy))
		style.set_bg_color(Color(0,0,1,1))
		letter.set("custom_styles/normal",style)
		letter.text="M"
		letter.set_custom_minimum_size(Vector2(fsy/2,fsy/2))
		
		letter.set_size(Vector2(fsy,fsy))
		letter.text=alpha[i]
		letter.set_position(Vector2(letter.get_size().x*i,0))
		
		
					
		
		var inst = glscript
		letter.set_script(inst)
#			letter.setpos(i,j)
		add_child(letter)
	
	iList = get_children()

func setskip(r,c):
	skip = Vector2(r,c)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func showbar(r,c,w):
	var currc = 0
	var xpos=0
	var ypos
	set_position(Vector2(0,0))
	show()
	skip=Vector2(r,c)
	print(skip)
	for n in get_children():
		
		xpos=fsx
		
#		if r == 0:
#			ypos=(((v.y)/(30)))
#		elif r==14:
#			ypos=(12)*(((v.y)/(30)))
#		else:
#			ypos = r*(((v.y)/(30)))

		ypos = r*(fsy)

		n.show()
		n.set_position(Vector2(xpos*currc,0))
		set_position(Vector2(0,ypos))
		
		
		currc+=1
		#print(String(xpos)+" "+String(ypos))

	
