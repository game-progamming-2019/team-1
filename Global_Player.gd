extends Node

var url_PlayerData:String = "res://Database/Database_Items.json"
#var inventory = {}
#var inventory_maxSlots = 25
#onready var playerData = Global_DatabaseParser.load_data(url_PlayerData)

func _ready():
	save_game()

#func load_data() -> void:
	#if playerData == null:
		#var dict:Dictionary = {"inventory":{}}
		#for slot in range (0, inventory_maxSlots):
			#dict["inventory"][str(slot)] = {"id": "0", "amount": 0}
		#Global_DatabaseParser.write_data(url_PlayerData, dict)
		#inventory = dict["inventory"]
	#else :
		#inventory = playerData["inventory"]
		

func save_game():
	# Get all the save data from persistent nodes
	var save_dict = {}
	var nodes_to_save= get_tree().get_nodes_in_group('persistent')
	for node in nodes_to_save:
		save_dict[node.get_path()] = node.save
		
	#Create a file
	var save_file = File.new()
	save_file.open(url_PlayerData, File.WRITE)
	
	#Serialize the data dictonary to JSON
	save_file.store_line(to_json(save_dict))
	
	#Wirte the JSON to the file ans save to disk
	save_file.close()
	
func load_game():
	#Try to load a saved file
	
