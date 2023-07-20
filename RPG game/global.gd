extends Node

var ordered_coffee = false
var current_scene = "world"
var transition_scene = false

var player_enter_town_posx = 0
var player_enter_town_posy = 0
var player_exit_town_posx = 0
var player_exit_town_posy = 0

func finish_changescenes():
	if transition_scene == true:
		transition_scene == false
		if current_scene == "world":
			current_scene = "calcaire_town"
		else:
			current_scene = "world"
