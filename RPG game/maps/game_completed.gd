extends Control

@onready var exit = $ExitBtn

func _ready():
	$AnimationPlayer.play("scroll")

func _on_exit_pressed(): #closes game
	get_tree().quit() 
