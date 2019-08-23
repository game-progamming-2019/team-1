extends "res://items/collectables.gd"

func body_entered(body):
	if body.name == "Player":
		body.HEALTH += 1
		queue_free()