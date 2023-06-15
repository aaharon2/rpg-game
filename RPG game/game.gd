extends Node

var ordered_coffee = false
func _ready():
	var inventory = {
		0: {
			"Name": "Coffee",
			"Des": "Warm coffee for cold days",
			"Icon": preload("res://assets/Coffee Mug 001 16x161.png"),
			"Count": 1
			},
		}
