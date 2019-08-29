extends TileMap
var Error
func _ready():
	var size = get_cell_size()
	var offset = size /2
	for tile in get_used_cells():
		var name = get_tileset().tile_get_name(get_cell(tile.x,tile.y))
		Error = name
		var zwischenstop = str("res://Enemies/",name)
		zwischenstop= str(zwischenstop,".tscn")
		var node = load(zwischenstop).instance()
		node.global_position =tile * size +offset
		get_parent().call_deferred("add_child",node)
	queue_free()