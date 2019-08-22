extends KinematicBody2D

export var SPEED = 200
export var TYPE = "ENEMY"
export var MAXHEALTH = 2
var HEALTH = MAXHEALTH
var direction = Vector2()
var spritedir = "down"
var hitstun = 0
var knockdir = Vector2(0,0)
var world : TileMap
var dropchance = 6
var state = "default"

var texture_default = null
var texture_hurt = null


func _ready():
	if TYPE == "ENEMY":
		set_collision_mask_bit(1,1)
		set_physics_process(false)
	texture_default = $Sprite.texture
	texture_hurt = load($Sprite.texture.get_path().replace(".png","_hurt.png"))

func init(tilemap):
	world=tilemap
func getInput():
	direction = Vector2()
	if(Input.is_action_pressed("ui_up")):
		direction.y = -1
	if(Input.is_action_pressed("ui_down")):
		direction.y = 1
	if(Input.is_action_pressed("ui_right")):
		direction.x = 1
	if(Input.is_action_pressed("ui_left")):
		direction.x = -1
	
		
func machWalk():
	var motion 
	if hitstun == 0:
		motion = direction.normalized()* SPEED
	else:
		motion = knockdir.normalized() * 125
	move_and_slide(motion, Vector2(0,0))

func use_item(item):
	var newitem = item.instance()
	newitem.add_to_group(str(newitem.get_name(),self))
	add_child(newitem)
	if get_tree().get_nodes_in_group(str(newitem.get_name(),self)).size() > newitem.maxamount:
		newitem.queue_free()
		
func damage_loop():
	HEALTH = min(MAXHEALTH,HEALTH)
	if hitstun >0:
		hitstun -= 1
		$Sprite.texture = texture_hurt
		
	else: 
		$Sprite.texture = texture_default
		if TYPE == "ENEMY" && HEALTH <= 0:
			var drop = randi() % dropchance
			if drop== 0:
				instance_scene(preload("res://items/erdbeere.tscn"))
			instance_scene(preload("res://Enemies/enemy_death.tscn"))
			queue_free()
		if TYPE == "PLAYER" && HEALTH <= 0:
			#var death_animation = preload("res://player_death.tscn").instance()
			#get_parent().add_child(death_animation=
			#death_animation.global_transform = global_transform
			state="GO"
			$Sprite.set_visible(false)
			
	for area in $hitbox.get_overlapping_areas():
		var body = area.get_parent()
		if hitstun == 0 and body.get("DAMAGE") != null and body.get("TYPE") != TYPE:
			HEALTH -= body.get("DAMAGE")
			hitstun = 10
			$sound.play(0.0)
			knockdir = global_transform.origin - body.global_transform.origin
			
		
func rand():
	var i =randi() % 8 + 1
	match i:
		1:
			direction = Vector2.UP
		2:
			direction = Vector2(1,-1)
		3:
			direction = Vector2.RIGHT
		4:
			direction = Vector2(1,1)
		5:
			direction = Vector2.DOWN
		6:
			direction = Vector2(-1,1)
		7:
			direction = Vector2.LEFT
		8:
			direction = Vector2(-1,-1)
			
func instance_scene(scene):
	var new_scene = scene.instance()
	new_scene.global_position = global_position
	get_parent().add_child(new_scene)

func machSprite():
	match direction:
		Vector2(-1,0):
			spritedir = "left"
		Vector2(1,0):
			spritedir = "right"
		Vector2(0,-1):
			spritedir = "up"
		Vector2(0,1):
			spritedir= "down"
func anim_switch(animation):
	var newanim = str(animation,spritedir)
	if $anim.current_animation != newanim:
		$anim.play(newanim)