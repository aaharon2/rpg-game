extends CharacterBody2D

func _physics_process(_delta):
	pass

func nerd():
	pass

func _on_nerd_area_area_entered(area):
	var player = get_node("/root/Game/Player")
	var player_area = get_node("/root/Game/Player/Detection Area")
	
	if area == player_area: #when player in olivias area
		player.nerd_in_range = true
