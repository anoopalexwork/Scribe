extends BaseButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var r
var c
var puzzle
var found=false
var style = StyleBoxFlat.new()
onready var charInput = get_node("/root/Scribe/charInput/")
onready var gb = get_node("/root/Scribe/gb/")
# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("pressed",self,"_on_pressed")
	puzzle = get_node("/root/Scribe/gb")
	style.set_bg_color(Color(1,0,0,1))
	
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass		


func _on_pressed():
#	get_node("/root/Scribe/AI").text=self.text
#	get_node("/root/Scribe/AI").lastx=r
#	get_node("/root/Scribe/AI").lasty=c

	#charInput.setskip(r,c)
	#charInput.show()
	if not charInput.visible:
		charInput.show()
		charInput.input = null
		charInput.showbar(r,c,get_size().x)
		
		#charInput.r = gb.r
		#charInput.c = gb.c 	
	else:
		
		charInput.hide()
	#self.found=true

	self.found = true
	getchar()
	#show()
#	print(puzzle.getc(r,c))
#	self.set("custom_styles/normal",style)
#	self.set("custom_styles/hover",style)
	#var thisBtn = self

func setpos(x,y):
	r=x
	c=y

func out():
	print(self.to_string()+" "+self.text)

func getme():
	return self
	
func getchar():
	if (self.found):
		#var mychar = get_node("/root/Scribe").board[r][c]
		self.text = get_node("/root/Scribe").board[r][c]
		
		print("-"+self.text)
		return self.text
	else:
		return " "
