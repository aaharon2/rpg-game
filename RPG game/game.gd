extends Node

signal level_changed(level_name)

@export var level_name = "level"

func _ready():
	pass

func _process(delta):
	pass
	#change_scene()

#func _on_town_transition_body_entered(body):
#	if body.has_method("player"):
#		_on_level_changed(level_name)
		#Global.town_transition = true

#func _on_town_transition_body_exited(body):
	#if body.has_method("player"):
		#Global.town_transition = false
		
#func change_scene():
	#if Global.town_transition == true:
		#if Global.current_scene == "world":
			#get_tree().change_scene_to_file("res://calcaire_town.tscn")
			#Global.player_exit_town_posx = 720
			#Global.player_exit_town_posy = 608
			#Global.finish_changescenes()


#func _on_level_changed(level_name):
#	emit_signal("level_changed", level_name)
