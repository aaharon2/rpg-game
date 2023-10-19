extends AudioStreamPlayer

func _ready():
	stream = load("res://music + fx/dungeon002.ogg")

func _process(_delta):
	if Global.in_dungeon == true and not playing:
		volume_db =+ 15
		play()
	elif Global.in_dungeon == false:
		stop()
