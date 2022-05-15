extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var rows = 15
var cols = 27
export var gBoard=[]
var gRow=[]
export var gList = []
var letter
var lastBtn
onready var root=get_node("/root/Scribe")
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
			
		
		
		
			 
	var v = root.get_viewport().size
	var fsy = v.y / (22.5)
	var fsx=	fsy	#Preferable to keep >=18 but experiment
	
	var charsize=1
	var wordsize
	var margin=20
	
	
	set_position(Vector2(10,10))
	var f=DynamicFont.new()
	f.font_data=load("res://Xolonium-Regular.ttf")
	var glscript = load("getletter.gd")
	
	
	for i in range(0,rows):
		for j in range(0,cols):
			letter =Button.new()
			letter.hide()
			letter.set("custom_fonts/font", f)
			letter.get("custom_fonts/font").set_size(int(fsy))
			letter.text="M"
			#var msize = letter.get_size().x
			#letter.set_custom_minimum_size(Vector2(fsy/2,fsy/2))
			
			letter.set_size(Vector2(fsy/2,fsy/2))
			letter.text="."
			letter.set_position(Vector2(2,2))
			
						
			
			var inst = glscript
			letter.set_script(inst)
			letter.setpos(i,j)
			
			add_child(letter)
	
	gList = get_children()
	posify()
	
	
	#print(gBoard[7][7].get().to_string())
func posify():
	var i=0
	var x=0
	var y=0
	for n in gList:
		i=0 
		gRow.append(get_child(i))
		i+=1
		y+=1
		if y>=cols:
			gBoard.append_array(gRow)
			y=0
			x+=1
		
	
func aBtn(r,c):
	return gBoard[r][c].get()

func draw():
	var posx=0
	var posy=0
	var posr=0
	var posc=0
	#for n in $gb.get_children():
	for n in gList:
		if n.text==".":
			n.hide()
		else:
			#n.text = n.getchar()
			
			n.show()
		
		#print("gtext is "+n.getchar())			
		n.set_position(Vector2(posx,posy))
		posx+=n.get_size().x
		if posx >= cols*n.get_size().x:
			posx=0
			posy += n.get_size().y
			
		posc+=1
		if posc >= cols:
			posc=0
			posr+=1
			

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func setbtn(w,r,c):
	var x=0
	var y=0
	var i=0
	#var j=(r+c)*r)/((rows)*(cols))
	var j=((r)*(rows))+(c)
	
	for n in get_children():
		#var d=((x+y)*cols*y)/(rows*cols)
		#if w=="w":
		var cj = ((y*cols))+x
		#print(x," ",y," ",i," ",j,"-",cj,n.text)
		if i==j:
			n.text=w
			break


		i+=1
		y+=1
		if y>=cols:
			y=0
			x+=1

#func getbtn(r,c):
#	var x=0
#	var y=0
#	var i=0
#	#var j=(r+c)*r)/((rows)*(cols))
#	var j=((r)*(rows))+(c)
#	print("rc",rows,cols)
#	for n in get_children():
#		if i==j:
#			return n.text
#
#
#		i+=1
#		y+=1
#		if y>=cols:
#			y=0
#			x+=1

#func found(r,c):
#	var j=((r)*(cols))+(c)
#	print("found"+String(r)+String(c))
#	gList[j].found = true

func getc(r,c):
	#gBoard = get_children()
	var j=((r)*(cols))+(c)
	return gList[j].getchar()
	#return gBoard[j].text
	
func setc(letter,r,c):
	#gBoard = get_children()
	var j=((r)*(cols))+(c)
	gList[j].text = letter
	#return gBoard[j].text
