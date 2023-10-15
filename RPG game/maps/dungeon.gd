extends Node2D

func _ready():
	$Task.hide()

func _process(delta):
	if Global.monster_alive == false:
		$Task.show()

func _on_dungeon_body_entered(body):
	if body.has_method("player"):
		Global.in_dungeon = true

func _on_dungeon_body_exited(body):
	if body.has_method("player"):
		Global.in_dungeon = false

