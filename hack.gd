extends "res://items/collectables.gd"

func body_entered(body):
	if body.name == "Player":
		body.hack = true
		queue_free()
		
func _ready():
	Error= connect("body_entered",self,"body_entered")