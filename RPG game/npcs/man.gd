extends CharacterBody2D

func _physics_process(_delta):
	pass

func man():
	pass

func _on_man_area_area_entered(area):
	var player = get_node("/root/Game/Player")
	var player_area = get_node("/root/Game/Player/Detection Area")
	
	if area == player_area: #when player in mans area
		player.man_in_range = true
