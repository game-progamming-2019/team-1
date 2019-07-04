extends KinematicBody2D

export var SPEED = 200
export var type = "enemy"
var direction = Vector2()

var world : TileMap

func _ready():
	pass # Replace with function body.

func init(tilemap):
	world=tilemap
func getInput():
	direction = Vector2()
	if(Input.is_action_pressed("ui_up")):
		direction.y = -1
		$AnimationPlayer.play("up")
	if(Input.is_action_pressed("ui_down")):
		direction.y = 1
		$AnimationPlayer.play("down")
	if(Input.is_action_pressed("ui_right")):
		direction.x = 1
		$AnimationPlayer.play("right")
	if(Input.is_action_pressed("ui_left")):
		direction.x = -1
		$AnimationPlayer.play("left")
		
func machWalk():
	var motion =  direction.normalized() *SPEED
	move_and_slide(motion, Vector2(0,0))
	
func rand():
	var i =randi() % 4 + 1
	match i:
		1:
			direction = Vector2.LEFT
			print("LEFT")
		2:
			direction = Vector2.RIGHT
			print("LEFTNT")
		3:
			direction = Vector2.UP
			print("UP")
		4:
			direction = Vector2.DOWN
			print("DOWN")
