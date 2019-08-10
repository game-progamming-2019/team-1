extends Node

onready var file = File.new()

func load_data(url) -> Dictionary:
	if url == null: return {}
	if !file.file_exists(url) : return {}
	file.open(url, File.READ)
	var data = JSON.parse(file.get_as_text())
	file.close()
	print(data.result)
	return data.result

func write_data(url:String, dict:Dictionary):
	if url == null: return 
	file.open(url, File.WRITE)
	file.store_line(to_json(dict))
	file.close()
	return
	

