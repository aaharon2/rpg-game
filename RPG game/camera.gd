extends Camera2D

@export var tilemap: TileMap

func _read():
	var mapRect = tilemap.get_used_rect()
	var tileSize = tilemap.cell_quadrant_size
	var worldSize = mapRect.size * tileSize
	limit_top = 0
	limit_left = 0
	limit_right = worldSize.x
	limit_bottom = worldSize.y
	
func _process(delta):
	pass
