extends "res://entity.gd"


export var Topf = "rnd"
func _ready():
	MAXHEALTH = 1
	dropchance = 3
	Topf = "rnd"
func _physics_process(delta):
	damage_loop()
	