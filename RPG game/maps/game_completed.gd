extends Control

@onready var exit = $ExitBtn

func _ready():
	pass

func _on_exit_pressed():
	get_tree().quit()
