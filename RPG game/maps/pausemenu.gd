extends Control

func _physics_process(delta):
	print("paused")
	if Input.is_action_just_pressed("esc"):
		show()
		get_tree().paused = true	

func _on_resume_game_pressed():
	hide()
	get_tree().paused = false

func _on_quit_pressed(): #closes game
	get_tree().quit()
