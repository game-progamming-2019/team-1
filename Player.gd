extends "res://entity.gd"


var keys = 0
var rezept: bool = false
var hack:bool = false
var tomate:bool = false
var spag:bool = false
func _ready():
	MAXHEALTH = 3
	HEALTH = MAXHEALTH
	Error = rezept 
	NAME = "Player"
	Error = hack 
	Error = tomate
	Error = spag
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
		use_item(preload("inventar.tscn"))
		state="pause"
func state_swing():
	anim_switch("idle")
	machWalk()
	damage_loop()
	direction = Vector2(0,0)
func state_talk():
	anim_switch("idle")
	print("talk")
	getPInput()
func state_pause():
	get_tree().paused= true
	print("help")
	#$pause.visible=true
	getPInput()
	
func getPInput():
	if(Input.is_action_just_pressed("pause")&&state!="GO"):
		get_tree().paused = false
		get_node("inventar").queue_free()
		#$pause.visible=false
		state="default"
	if(Input.is_action_just_pressed("a")&&state=="talk"):
		get_parent().get_node("dialog").queue_free()
		get_tree().paused = false
		state="default"
	if(Input.is_action_just_pressed("pause")&&state=="GO"):
		Error=get_tree().reload_current_scene()
func state_GO():
	get_tree().paused=true
	getPInput()
	