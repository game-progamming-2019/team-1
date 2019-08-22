extends StaticBody2D

var Error
#notrdy
func _ready():
	$area.connect("body_entered",self,"body_entered")
	
func body_entered(body):
	print("peng")
	if body.name == "Player" && body.get("keys") >0:
		body.keys-=1
		queue_free()
#