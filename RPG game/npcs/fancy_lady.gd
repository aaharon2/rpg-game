extends CharacterBody2D

func _physics_process(_delta):
	pass

func fancy_lady():
	pass

func _on_merida_area_area_entered(area):
	var player = get_node("/root/Game/Player")
	var player_area = get_node("/root/Game/Player/Detection Area")
	
	if area == player_area: #when player in meridas area
		player.lady_in_range = true
	if area != player_area:
		player.lady_in_range = false
