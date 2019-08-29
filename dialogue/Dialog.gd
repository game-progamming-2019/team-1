extends Control

# Declare member variables here. Examples:
var Error
export var nr: int = 001
var text
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	text = "Bla"
	Error=$area.connect("body_entered",self,"body_entered")
	Error = $area.connect("body_exited",self,"body_exited")
	hide()
func _process(delta):
	Error= delta
	set_text(nr)
		
func body_entered(body):
	body.state="talk"
	show()
#	pass
func body_exited(body):
	Error = body
	hide()
func set_text(nummi):
	match nummi:
		001: 
			$Dialog.text="Obacht Freundchen, ich hab Hunger und nichts kann meinen Appetit stillen.\nDu besorgst mir jetzt besser was zu futtern, oder es klatscht, aber keen Beifall."
		002:
			$Dialog.text="Zum Glück hastes geschafft. Heftiger Typ, ey"