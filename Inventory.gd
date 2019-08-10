extends Control

export var size = Vector2( 64, 64 )
export var IMode:int #IconMode
export var SMode:int #SourceMode

onready var weaponlist  = get_node("Weapons")
onready var recipelist  = get_node("recipes")
onready var ingreedlist = get_node("ingreeds")
onready var equipment   = get_node("equipment")
onready var items = preload("res://textures/Texturatlas.png")

enum listmode {
	WeaponMode = 1,
	recipeMode = 2,
	ingreedMode = 3,
	equip = 4
	}

func _ready():
	#Initialize Item List
	initList(weaponlist, 3, size ,IMode, SMode, true)
	initList(recipelist, 5, size ,ItemList.ICON_MODE_TOP, ItemList.SELECT_SINGLE, true)
	initList(ingreedlist, 5, size,ItemList.ICON_MODE_TOP, ItemList.SELECT_SINGLE, true)
	initList(equipment, 5, size,ItemList.ICON_MODE_TOP, ItemList.SELECT_SINGLE, true)
	
	#weaponlist.set_max_columns(9)
	#itemlist.set_fixed_icon_size(Vector2(128,128))
	#itemlist.set_icon_mode(ItemList.ICON_MODE_TOP)
	#itemlist.set_select_mode(ItemList.SELECT_SINGLE)
	#itemlist.set_same_column_width(true)
	

	
	

func initList(list:ItemList, ColumnSize, IconSize:Vector2, IMode, SMode , same_column_width):
	list.set_max_columns(ColumnSize)
	list.set_fixed_icon_size(IconSize)
	list.set_icon_mode(IMode)
	list.set_select_mode(SMode)
	list.set_same_column_width(same_column_width)

func initItems(mode)->void :
	var list
	Global_ItemDatabase.get_item(
	
	
	
func save():
	var save_dict = {
		weapons = {
			
		}
	}
	
