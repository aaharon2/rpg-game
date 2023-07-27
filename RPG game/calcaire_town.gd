extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	#change_scene()


func _on_main_map_transition_body_entered(body):
	if body.has_method("player"):
		get_tree().change_scene_to_file("res://game.tscn")
		#Global.world_transition = true


#func _on_main_map_transition_body_exited(body):
	#if body.has_method("player"):
		#Global.world_transition = false
		
#func change_scene():
	#if Global.world_transition == true:
		#if Global.cur_scene == "calcaire_town":
			#get_tree().change_scene_to_file("res://game.tscn")
			#Global.player_enter_town_posx = 722
			#Global.player_enter_town_posy = 11
			#Global.finish_changescenes()
