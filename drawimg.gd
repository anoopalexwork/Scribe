extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var alpha = "abcdefghijklmnopqrstuvwxyz"
var myword = "anoop"  
var wordimg = []
var imglist =[]
# Called when the node enters the scene tree for the first time.
func _ready():
	print(myword)
	var code= codify(myword)
	wordimg =makeimg(code)
	drawimg(wordimg,100,100)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func codify(x):				#Returns list of char codes for x
	var codelist=[]
	for i in x:
		for j in alpha.length():
			if i == alpha[j]:
				codelist.append(j)
				break
	return codelist
			
func makeimg(code): 		#
	
	var word = AnimatedSprite.new()
	word.frames = SpriteFrames.new()
	word.frames.add_animation("letter")
	for n in code:
		word.frames.add_frame("letter",$Alphabet.frames.get_frame("char",n))
		
	return word
		
func drawimg(img,x,y,n=-1):
	var ssheet = img.frames
	var posx = Vector2(x,y)
	var ci_list= VisualServer.canvas_item_create()
	VisualServer.canvas_item_set_parent(ci_list,get_canvas_item())
	if n == -1:
		n = ssheet.get_frame_count("letter")
		var sp_list = []
		for i in n:
				sp_list.append(Sprite.new())
				sp_list[i].texture = ssheet.get_frame("letter",i) #Texture
		for i in sp_list:
			#VisualServer.canvas_item_add_texture_rect(ci_list,Rect2(posx,Vector2(1,100)),i.texture.get_rid())	
			i.texture.draw(ci_list,posx)
			posx+=Vector2(100,0)
			var t = Transform2D().rotated(deg2rad(20*rand_range(0,30)))
			VisualServer.canvas_item_set_transform(ci_list,t)
	else:
		var s = Sprite.new()
		s.texture = ssheet.get_frame("letter",n)		
		s.texture.draw(ci_list,posx)
					
		
