extends Node2D
var Error

func _ready():
	
	$anim.play("default")
	$anim.connect("animation_finished",self,"destroy")
	
func destroy(animation):
	Error = animation
	queue_free()