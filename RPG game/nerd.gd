extends CharacterBody2D

func _physics_process(_delta):
	pass

func nerd():
	pass


func _on_area_2d_area_entered(area):
	var player = get_node("/root/Game/Player")
	var player_area = get_node("/root/Game/Player/Detection Area")
	
	if area == player_area:
		player.nerd_in_range = true
