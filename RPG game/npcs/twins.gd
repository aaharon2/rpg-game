extends CharacterBody2D

func _physics_process(_delta):
	pass

func twins():
	pass

func _on_twins_area_area_entered(area):
	var player = get_node("/root/Game/Player")
	var player_area = get_node("/root/Game/Player/Detection Area")
	
	if area == player_area: #when player in twins area
		player.twins_in_range = true
	if Global.monster_alive == false: #can't talk to twins when the monster dies
		player.twins_in_range = false
