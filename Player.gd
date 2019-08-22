extends "res://entity.gd"


var keys = 0
var Error
func _ready():
	MAXHEALTH = 3
	HEALTH = MAXHEALTH
	TYPE = "PLAYER"
	state = "default"

func _physics_process(delta):
	Error = delta
	match state:
		"default":
			state_default()
		"swing":
			state_swing()
		"talk":
			state_talk()
		"pause":
			state_pause()
		"GO":
			state_GO()
func state_default():
	keys = min(keys,9)
	getInput()
	machWalk()
	machSprite()
	damage_loop()
	
	if direction != Vector2(0,0):
		anim_switch("walk")
	else:
		anim_switch("idle")
	if Input.is_action_just_pressed("b"):
		use_item(preload("items/sword.tscn"))
	if Input.is_action_just_pressed("pause"):
		state="pause"
func state_swing():
	anim_switch("idle")
	machWalk()
	damage_loop()
	direction = Vector2(0,0)
func state_talk():
	anim_switch("idle")
	getInput()
func state_pause():
	get_tree().paused= true
	
	getPInput()
	
func getPInput():
	if(Input.is_action_just_pressed("pause")):
		get_tree().paused = false
		state="default"
func state_GO():
	get_tree().paused=true
	getPInput()
	