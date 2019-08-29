extends StaticBody2D

onready var player = get_parent().get_node("Player")
var Error
func _ready():
	Error= $area.connect("body_entered",self,"body_entered")
	Error= $sound.connect("finished",self,"finished")
	
	
func finished():
	$Sprite.visible =false
	$Label.visible=true
	
	
func body_entered(body):
	if body.name == "Player"&&player.hack ==true &&player.tomate ==true&&player.spag==true:
		$sound.play(0.0)
		player.state="GO"
		print("You did it")
		#queue_free()