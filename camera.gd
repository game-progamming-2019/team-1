extends Camera2D
var Error
func _ready():
	Error = $area.connect("body_entered",self,"body_entered")
	Error = $area.connect("body_exited",self, "body_exited")
	Error = $area.connect("area_exited",self,"area_exited")
func _process(delta):
	Error = delta
	var pos = get_parent().global_position - Vector2(0,32)
	var x = floor(pos.x /640) * 640
	var y = floor(pos.y / 352)* 352
	global_position = Vector2(x,y)
	
func body_entered(body):
	if body.get("TYPE") == "ENEMY":
		body.set_physics_process(true)
func body_exited(body):
	if body.get("TYPE") == "ENEMY":
		body.set_physics_process(false)
func area_exited(area):
	if area.get("disappears") == true:
		area.queue_free()