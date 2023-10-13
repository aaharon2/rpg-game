extends CharacterBody2D



func _physics_process(_delta):
	pass

func mother():
	pass


func _on_mother_area_area_entered(area):
	var player = get_node("/root/Game/Player")
	var player_area = get_node("/root/Game/Player/Detection Area")
	
	if area == player_area:
		player.mother_in_range = true
