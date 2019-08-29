extends "res://entity.gd"

export var Topf = "rnd"

func _ready():
	MAXHEALTH = 1
	NAME = "Topf"
	dropchance = 3
	Topf = "rnd"
func _physics_process(delta):
	Error = delta
	damage_loop()
	