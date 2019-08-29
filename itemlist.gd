extends Control

var TYPE = null
const DAMAGE = 0.5
var maxamount =1
var Error
func _ready():
	TYPE = get_parent().get_parent().TYPE
	Error = maxamount
	if get_parent().get_parent().has_method("state_swing"):
		get_parent().get_parent().state = "pause"
	#rect_position=get_parent().get_parent().get_node("hud").get_node("Sprite").get_transform()
	print(get_parent().get_parent().get_parent().get_node("hud").get_node("Sprite").get_region_rect())

func destroy(animation):
	Error = animation
	if get_parent().get_parent().has_method("state_pause"):
		get_parent().get_parent().state = "default"
	get_parent().queue_free()