extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var alpha = "abcdefghijklmnopqrstuvwxyz"
var wordList
#var four = []
#var five = []
#var six = []
#var seven = []
#var eight = []
#var nine = []
#var ten = []
#var eleven = []
#var twelve = []
#var thirteen = []
var nlist = []
#var list = [] 
# Called when the node enters the scene tree for the first time.
func _ready():
	var i = 4
	var path
	var list	
	var n=0

	while i <=13:
		path = "res://DB/n"+String(i)+".txt"
		list = makelist(path)
		nlist.append(list)
		i=i+1
	
	
	
	
func getrands(rgx):
	var regex = RegEx.new()
	regex.compile("^("+rgx+")$")
	var results = []
	var count = 0

	#print("Matching "+rgx)
	#print("list"+String(rgx.length()-4))
	#print(nlist[rgx.length()-4][0])
	for i in nlist[rgx.length()-4]:
		var res = regex.search(i)
		if res != null:
			results.append(i)
			count +=1
	
#	for i in int(results.size()):
#		randomize()
#		results.shuffle()
	
	print(String(count)+" Matches:"+ rgx)
	return results
		
				
			
	
func makelist(path):
	var f = File.new()
	var err
	var word
	var list =[]
	if f.file_exists(path):
		print("found "+path)
	else:
		print(path+"not found!")
		return null
	#print("opening "+path)
	f.open(path,File.READ)
	while f.get_position() < f.get_len():
		word=f.get_line()
		list.append(word)
	#err = f.get_error()
	#print(String(err)+" Error")
	f.close()
	print("Loaded "+String(list.size())+" from "+ path)	
	return list
#	var f = File.new()
#	f.open("five.txt",File.READ)
#	var a=[]
#	while not f.eof_reached():
#		a= f.get_as_text()
#	f.close()
#	return a
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func nword(n,i=0):

	var size=n - 4 
	return nlist[size][i]
#	match(size):
#		4: return four[i]
#		5: return five[i]
#		6: return six[i]
#		7: return seven[i]
#		8: return eight[i]
#		9: return nine[i]
#		10: return ten[i]
#		11: return eleven[i]
#		12: return twelve[i]
#		13: return thirteen[i]
#
#
