extends Control

var pause = false

func _ready():
	if Input.is_action_pressed("ui_cancel"):
		pause.visible = true
		get_tree().paused = true	

func _on_resume_game_pressed():
	pause.visible = false
	get_tree().paused = false

func _on_quit_pressed():
	get_tree().quit()
