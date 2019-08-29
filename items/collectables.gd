extends Area2D

export (bool) var disappears = false
var Error

func _ready():
	Error = disappears
	Error= connect("area_entered",self,"area_entered")
	

func area_entered(area):
	var area_parent = area.get_parent()
	if area_parent.name == "sword":
		get_node(self.get_path()).body_entered(area_parent.get_parent())
		#body_entered(area_parent.get_parent())
