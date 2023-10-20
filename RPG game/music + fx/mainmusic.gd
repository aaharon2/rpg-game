extends AudioStreamPlayer

func _ready():
	stream = load("res://music + fx/TownTheme.mp3")
	bus = "Music"
	print(bus)
	play()

func _process(delta):
	if Global.in_dungeon == true:
		if volume_db >= 0:
			volume_db -= 0.05 * delta
		if volume_db <= 40:
			stop()
	elif Global.in_dungeon == false and not playing:
		play()
