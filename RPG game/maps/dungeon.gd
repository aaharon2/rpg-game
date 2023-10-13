extends Node2D

func _ready():
	pass # Replace with function body.

func _process(delta):
	pass

func _on_dungeon_body_entered(body):
	if body.has_method("player"):
		Global.in_dungeon = true

func _on_dungeon_body_exited(body):
	if body.has_method("player"):
		Global.in_dungeon = false
