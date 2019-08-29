extends "res://items/collectables.gd"


func _ready():
	Error = connect("body_entered",self,"body_entered")
	
func body_entered(body):
	if body.name == "Player" && body.get("keys") < 9:
		body.keys+=1
		queue_free()