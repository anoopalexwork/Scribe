extends Node2D
enum {R,C}

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var alpha = "abcdefghijklmnopqrstuvwxyz"
var wordimg = []
var imglist =[]
export var rows=27
export var cols=15
var board = []
var gRow = []
var gBoard = []
var lastx
var lasty
var wordlist=[]


# Called when the node enters the scene tree for the first time.
func _ready():
	generate(rows,cols)
	#makepuzzle()


	#$gb.setbtn("x",2,3)
	
	#print($gb.getc(2,2)+"SS")
	#print($search.nword(5,2))
	
	
	#var matchwords = $search.getrands("...t...")
#	if matchwords != null:
#		print(matchwords)
		
	#matchwords = $search.getrands(".g..e.")
#	if matchwords != null:
#		print(matchwords)
	
			
func _process(delta):
	pass
	
func generate(r,c):
	rows = c
	cols = r
	var line
	for i in range(rows):
		line = ""
		for j in range(cols):
			line+="."
		board.append(line)


#


func pressedme():
	print($gb.gBoard[0][2])
#
func draw():
	var posx=0
	var posy=0
	var posr=0
	var posc=0
	#for n in $gb.get_children():
	for n in $gb.gList:
		if n.text==".":
			n.hide()
		else:
			n.text = n.getchar()
			
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

func clear():
	for i in rows:
		for j in cols:
			board[i][j]="."

func makepuzzle():
	
	
	clear()
	var midcols = $search.getrands(getcol(1,13,13))
	randomize()
	#midcols.shuffle()
	var firstcol
	while true:
		clear()
#		firstcol=midcols.pop_back()
		$words.list=[]
#		$words.addword(firstcol,1,13,1)
		
		#print(firstcol + "poopped")
		#setcol(firstcol,1,13)
		
		if not makeword(1,13,13):	#setrow("corroboration",7,7)
			continue
		if not makeword(7,7,13,R):	#setrow("corroboration",7,7)
			continue
		
		if not makeword(4,0,12,R):	#setrow("untouchables"4,0)
			continue
		if not makeword(0,0,7):		#setcol("stimuli",0,0)
			continue
		if not makeword(1,2,6,R):	#setrow("arenas",1,2)
			continue
		if not makeword(1,10,7,R):	#setrow("knavery",1,10)
			continue
		if not makeword(0,11,6):	#setcol("uneasy",0,11)
			continue
		if not makeword(0,2,7):		#setcol("faintly",0,2)
			continue
		if not makeword(0,4,7):		#setcol("rewound",0,4)
			continue	
		if not makeword(0,6,7):		#setcol("banshee",0,6)
			continue

		if not makeword(4,15,12,R):	#setrow("encompassing",4,15)
			continue
		if not makeword(0,15,6):	#setcol("probes",0,15)
			continue
		if not makeword(1,19,6,R):	#setrow("dopier",1,19)
			continue
		if not makeword(0,20,7):	#setcol("notepad",0,20)
			continue
		if not makeword(0,22,7):	#setcol("sinuses",0,22)
			continue
		if not makeword(0,24,7):	#setcol("granite",0,24)
			continue
		if not makeword(0,26,7):	#setcol("fledges",0,26)
			continue

		if not makeword(10,0,12,R):	#setrow("convalescing",10,0)
			continue
		if not makeword(13,10,7,R):	#setrow("rustler",13,10)
			continue
		if not makeword(13,2,6,R):	#setrow("versed",13,2)
			continue
		if not makeword(9,11,6):	#setcol("",7,11)
			continue
		if not makeword(8,0,7):	#setcol("suckers",8,0)
			continue
		if not makeword(8,2,7):	#setcol("connive",8,2)
			continue
		if not makeword(8,4,7):	#setcol("floaders",8,4)
			continue
		if not makeword(8,6,7):	#setcol("fresher",8,6)
			continue

		if not makeword(10,15,12,R):	#setrow("contrariwise",10,15)
			continue
		if not makeword(9,15,6):	#setcol("scopes",9,15)
			continue	
		if not makeword(13,19,6,R):	#setrow("golden",3,19)
			continue
		if not makeword(8,26,7):	#setcol("flexing",8,26)
			continue
		if not makeword(8,24,7):	#setcol("flexing",8,26)
			continue
		if not makeword(8,22,7):	#setcol("flexing",8,26)
			continue
		if not makeword(8,20,7):	#setcol("flexing",8,26)
			continue
		break
	show()
	$gb.draw()
	$words.getword(1,2)
	
# 012345678901234567890123456
#0s.f.r.b....u...p....n.s.g.f
#1t.arenas..knavery..dopier.l2
#2i.i.w.n.t..e.u.o..l.t.n.a.e
#3m.n.o.s.u..a.l.b..o.e.u.n.d
#4untouchables.c.encompassing
#5l.l.n.e.e..y.a.s..k.a.e.t.e3
#6i.y.d.e......n......d.s.e.s
#7.......corroboration.......
#8s.c.l.f......l......s.e.e.f
#9u.o.o.r.i....o.s..s.w.p.v.l
#0convalescing.g.contrariwise
#1k.n.d.s.e....i.o..e.l.s.d.x
#2e.i.e.h.s....s.p..w.l.o.e.i
#3r.versed..rustler..golden.n
#4s.e.s.r........s....w.e.t.g

func makeword(r,c,l,dir=C):
	var matchlist=[]
	var randpos
	var rgx	
	if dir==C:
		rgx = getcol(r,c,l)
		#print("searching "+rgx)
		matchlist=$search.getrands(rgx)
		if matchlist.size()!=0:
			randomize()
			randpos=rand_range(0,matchlist.size())
			setcol(matchlist[randpos],r,c)
			#print(getcol(r,c,l))
			$words.addword(matchlist[randpos], r,c,C)
			return true
		else:
			print("Match fail")
			return false
	else:
		rgx = getrow(r,c,l)
		#print("Searching "+rgx)
		matchlist=$search.getrands(rgx)
		if matchlist.size()!=0:
			randomize()
			randpos=rand_range(0,matchlist.size())
			setrow(matchlist[randpos],r,c)	
			$words.addword(matchlist[randpos], r,c,R)
			#print(getrow(r,c,l))
			return true
		else:
			print("Match fail")
			return false
	
	

func setrow(word,r,c):
	var pos=0

	if word != null:
		for i in word:
			board[r][c+pos]=i
			$gb.setc(i,r,c+pos)
			pos+=1
		

func setcol(word,r,c):
	var pos =0
	#print(word+" "+String(word.length()))
	
	if word != null:
		for i in word:
			board[r+pos][c]=i
			$gb.setc(i,r+pos,c)
			pos+=1

	
	
func getrow(r,c,l):
	var pos =0
	var word=""
	for i in l:
		word+=board[r][c+pos]
		pos+=1

	return word

func getcol(r,c,l):
	var pos =0
	var word=""
	for i in l:
		word+=board[r+pos][c]
		pos+=1
	
	return word

func show():
	for j in range(0,rows):
		print(board[j])			

func drawcirc(word,r):
	var fs=10			#Preferable to keep >=18
	var charsize=1
	var letter
	var f=DynamicFont.new()
	f.font_data=load("res://Xolonium-Regular.ttf")	
	$theword.set_position(Vector2(100,100))
	
	for i in word:
		letter = Button.new()
		letter.set_custom_minimum_size(Vector2(fs*2,fs*2))
		letter.text=i
		letter.set("custom_fonts/font", f)
		letter.get("custom_fonts/font").set_size(fs)
		$theword.add_child(letter,true)
	
	var angle = 0	
	for i in $theword.get_children():
		
		var posx =  r * sin(deg2rad(angle))
		var posy =  r * cos(deg2rad(angle))
		print(angle,",",posx+r,",",posy+r)
		angle+=int((380 / word.length()))
		i.set_position(Vector2(posx+r,posy+r))
		print(i.name)		
	
#
#func codify(x):				#Returns list of char codes for x
#	var codelist=[]
#	for i in x:
#		for j in alpha.length():
#			if i == alpha[j]:
#				codelist.append(j)
#				break
#	return codelist
#
#func makeimg(code): 		#
#
#	var word = AnimatedSprite.new()
#	word.frames = SpriteFrames.new()
#	word.frames.add_animation("letter")
#	for n in code:
#		word.frames.add_frame("letter",$Alphabet.frames.get_frame("char",n))
#
#	return word
#
#func drawimg(img,x,y,n=-1):
#	var ssheet = img.frames
#	var posx = Vector2(x,y)
#	var ci_list= VisualServer.canvas_item_create()
#	VisualServer.canvas_item_set_parent(ci_list,get_canvas_item())
#	if n == -1:
#		n = ssheet.get_frame_count("letter")
#		var sp_list = []
#		for i in n:
#				sp_list.append(Sprite.new())
#				sp_list[i].texture = ssheet.get_frame("letter",i) #Texture
#		for i in sp_list:
#			#VisualServer.canvas_item_add_texture_rect(ci_list,Rect2(posx,Vector2(1,100)),i.texture.get_rid())	
#			i.texture.draw(ci_list,posx)
#			posx+=Vector2(100,0)
#			var t = Transform2D().rotated(deg2rad(20*rand_range(0,30)))
#			VisualServer.canvas_item_set_transform(ci_list,t)
#	else:
#		var s = Sprite.new()
#		s.texture = ssheet.get_frame("letter",n)		
#		s.texture.draw(ci_list,posx)
#
#
#func drawword(word,vert=false):
#	var fs=16			#Preferable to keep >=18
#	var charsize=1
#	var wordsize
#	var margin=20
#
#	if (!vert):
#		wordsize = Vector2(charsize*word.length()+margin,charsize+margin)
#	else:
#		wordsize = Vector2(charsize+margin,charsize*word.length()+margin)
#
#
#	$theword.set_size(wordsize)
#	$theword.set_position(Vector2(100,100))
#	var f=DynamicFont.new()
#	f.font_data=load("res://Xolonium-Regular.ttf")	
#	var posx = 0
#	var posy = 0
#	var n=0
#	var letter
#	for i in word:
#		letter = Button.new()
#		letter.set_custom_minimum_size(Vector2(fs*3,fs*3))
#			#letter.set_size(Vector2(charsize,charsize))
#		#letter.set_position(Vector2(100,100))
#		letter.text=i
#		letter.set("custom_fonts/font", f)
#		letter.get("custom_fonts/font").set_size(fs*2)
#		$theword.add_child(letter,true)
#
#
#	for i in $theword.get_children():
#		i.set_position(Vector2(posx,posy))
#		if (!vert):
#			posx+=i.get_size().x
#		else:
#			posy+=i.get_size().y
#		print(i.name)




		
		 
	
		





