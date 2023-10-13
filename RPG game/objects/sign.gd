extends CharacterBody2D

var player_in_range = false

func _physics_process(_delta):
	if player_in_range == true:
		if Input.is_action_just_pressed("ui_accept"):
			DialogueManager.show_example_dialogue_balloon(load("res://main.dialogue"), "sign")
			return		

func _sign():
	pass
	
func _on_area_2d_body_entered(body):
	if body.has_method("player"):
		player_in_range = true
	
func _on_area_2d_body_exited(body):
	if body.has_method("player"):
		player_in_range = false
