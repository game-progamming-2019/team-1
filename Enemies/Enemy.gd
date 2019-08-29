extends "res://entity.gd"


const DAMAGE  = 0.25

func _ready():
	rand()
	

func _physics_process(delta):
	Error = delta
	damage_loop()
	machWalk()
	

func _on_Tim_timeout():
	rand()
#	use_item(preload("sword.tscn"))
	$Tim.start()
