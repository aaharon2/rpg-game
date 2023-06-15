extends CharacterBody2D

func _sign():
	pass

func _on_area_2d_body_entered(area):
	var player = get_node("/root/Game/Player")
	var player_area = get_node("/root/Game/Player/Detection Area")
	
	if area == player_area:
		player.sign_in_range = true
