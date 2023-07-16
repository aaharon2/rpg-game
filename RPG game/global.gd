extends Node

var ordered_coffee = false
var current_scene = "game"
var transition_scene = false

var player_enter_town_posx = 0
var player_enter_town_posy = 0
var player_exit_town_posx = 0
var player_exit_town_posy = 0

var inventory = {
	0: {
		"Name": "Coffee",
		"Des": "Warm coffee for cold days",
		"Icon": preload("res://assets/Coffee Mug 001 16x161.png"),
		"Count": 1
		},
	}

func finish_changescenes():
	if transition_scene == true:
		transition_scene == false
		if current_scene == "map":
			current_scene = "calcaire_town"
		else:
			current_scene = "map"
