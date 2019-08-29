extends CanvasLayer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var player = get_parent().get_node("Player")
const HEART_R_SIZE = 8
const HEART_OFFSET = 24
var texture_default = null
var texture_hurt = null

var Error
# Called when the node enters the scene tree for the first time.
func _ready():
	texture_default = $spag.texture
	texture_hurt = load($spag.texture.get_path().replace("_hurt.png",".png"))
	print(player.MAXHEALTH)
	for i in player.MAXHEALTH:
		var new_heart = Sprite.new()
		new_heart.texture = $hearts.texture
		new_heart.hframes = $hearts.hframes
		new_heart.set_region_rect($hearts.region_rect)
		new_heart.region_enabled = true 
		$hearts.add_child(new_heart)
	var HEALTH = get_parent().get_node("Player").HEALTH
	Error = HEALTH
func rezepte():
	if player.rezept == true:
		$hack.visible=true
		$tomate.visible=true
		$spag.visible=true
	if player.spag==true:
			$spag.texture=texture_hurt
	if player.hack==true:
			$hack.texture=texture_hurt
	if player.tomate==true:
			$tomate.texture=texture_hurt
func _process(delta):
	rezepte()
	Error = delta
	for heart in $hearts.get_children():
		var index = heart.get_index()
		
		var x = (index % HEART_R_SIZE) * HEART_OFFSET
		var y = (index / HEART_R_SIZE) * HEART_OFFSET
		heart.position = Vector2(x,y)
		index +=1
		var last_heart = ceil(player.HEALTH)
		if index > last_heart:
			heart.frame = 4
		if index == last_heart:
			heart.frame = ((player.HEALTH - last_heart) *4) * (-1)
		if index < last_heart:
			heart.frame = 0
		$keys.frame = player.keys