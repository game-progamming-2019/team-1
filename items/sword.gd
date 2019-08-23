extends Node2D

var TYPE = null
const DAMAGE = 0.5
var maxamount =1
var Error
func _ready():
	TYPE = get_parent().TYPE

	Error = $anim.connect("animation_finished",self,"destroy")
	Error = $anim.play(str("swing",get_parent().spritedir))
	if get_parent().has_method("state_swing"):
		get_parent().state = "swing"
	
	
	
func destroy(animation):
	if get_parent().has_method("state_swing"):
		get_parent().state = "default"
	queue_free()