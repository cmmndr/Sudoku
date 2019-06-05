extends Button

# Declare member variables here. Examples:
var my_number
onready var field_node = get_parent().get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	if(self.get_text() == "X"):
		my_number = ""
	else:
		my_number = self.get_text()
	self.connect("pressed", field_node, "change_number", [my_number, self])