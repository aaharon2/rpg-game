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
