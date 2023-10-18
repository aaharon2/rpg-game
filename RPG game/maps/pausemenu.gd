extends Control

func _ready(): 
	process_mode = self.PROCESS_MODE_ALWAYS #always running
	self.hide()

func _physics_process(_delta):
	if Input.is_action_just_pressed("esc") and get_tree().paused == false:
		show()
		get_tree().paused = true	

func _on_resume_game_pressed():
	if get_tree().paused == true:
		get_tree().paused = false
		hide()
	
func _on_quit_pressed(): #closes game
	get_tree().quit()
