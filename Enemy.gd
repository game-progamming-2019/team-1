extends "res://entity.gd"




func _ready():
	rand()
	

func _physics_process(delta):
	machWalk()

func _on_Tim_timeout():
	rand()
	$Tim.start()
