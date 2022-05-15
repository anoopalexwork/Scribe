extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var alpha = "abcdefghijklmnopqrstuvwxyz"
var wordimg = []
var imglist =[]
var rows
var cols
var board = []
var boardgfx

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func generate(r,c):
	rows = c
	cols = r
	var line
	for i in range(rows):
		line = ""
		for j in range(cols):
			line+="."
		board.append(line)
		
func draw():
	var v = get_node("/root").get_viewport().size
	var fsy = v.y / (21)
	var fsx=	fsy	#Preferable to keep >=18 but experiment
	
	var charsize=1
	var wordsize
	var margin=20
	
	
	$gfxBoard.set_position(Vector2(10,2))
	var f=DynamicFont.new()
	f.font_data=load("res://Xolonium-Regular.ttf")
	var glscript = load("getletter.gd")
	
	var posx = 0
	var posy = 0

	var letter
	
	for i in range(0,rows):
		for j in range(0,cols):
			letter = Button.new()
			letter.set_custom_minimum_size(Vector2(fsy*2,fsx*2))
			letter.set_size(Vector2(fsy*2,fsy*2))
			letter.set_position(Vector2(2,2))
			letter.text=getrow(i,j,1)
			letter.set("custom_fonts/font", f)
			letter.get("custom_fonts/font").set_size(int(fsy))
			var inst = glscript
			letter.set_script(inst)
			letter.setpos(i,j)
					
			add_child(letter)
	
		
func setcol(word,r,c):
	var pos =0
	for i in range(word.length()):
		board[r+pos][c]=word[i]
		setcell(word[i],c,r+pos)
		pos+=1

func setrow(word,r,c):
	var pos=0
	
	for i in range(word.length()):
		board[r][c+pos]=word[i]
		setcell(word[i],r+pos,c)
		pos+=1
	
	
#func getcell(c,r):
#	return 
		
		
func setcell(w,c,r):
	var x=0
	var y=0
	var i=0
	#var j=(r+c)*r)/((rows)*(cols))
	var j=(r*(cols))+c
	#print("rc",rows,cols)
	for n in $gfxBoard.get_children():
		var d=(x*rows)+y
		
		#var d=((x+y)*cols*y)/(rows*cols)
		#if w=="w":
		#	print(x," ",y," ",d," ",i," ",j)
		if i==j:
			n.text=w
			break

		i+=1
		y+=1
		if y>=cols:
			y=0
			x+=1	
			
func getrow(r,c,l):
	var pos =0
	var word=""
	for i in l:
		word+=board[c+pos][r]
		pos+=1
	
	return word

func getcol(r,c,l):
	var pos =0
	var word=""
	for i in l:
		word+=board[c][r+pos]
		pos+=1
	
	return word

func show():
	

	for j in range(0,rows):
		print(board[j])			
