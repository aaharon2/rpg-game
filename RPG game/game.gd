extends Node


func _ready():
	pass

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
		if Global.current_scene == "world":
			get_tree().change_scene_to_file("res://calcaire_town.tscn")
			Global.player_exit_town_posx = 720
			Global.player_exit_town_posy = 608
			Global.finish_changescenes()
