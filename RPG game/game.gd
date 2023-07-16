extends Node


func _ready():
	var inventory = {
		0: {
			"Name": "Coffee",
			"Des": "Warm coffee for cold days",
			"Icon": preload("res://assets/Coffee Mug 001 16x161.png"),
			"Count": 1
			},
		}
func _process(delta):
	change_scene()

func _on_town_transition_body_entered(body):
	if body.has_method("player"):
		Global.transition_scene = true

func _on_town_transition_body_exited(body):
	if body.has_method("player"):
		Global.transition_scene = false
		
func change_scene():
	if Global.transition_scene == true:
		if Global.current_scene == "map":
			get_tree().change_scene_to_file("res://.godot/calcaire_town.tscn")
			Global.finish_changescenes()
