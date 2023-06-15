extends Panel

var ordered_coffee = false
var itemClass = preload("res://item.tscn")
var item = null


func _ready():
	if ordered_coffee == true:
		item = itemClass.instance()
		add_child(item)


