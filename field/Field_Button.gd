extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("pressed", get_parent(), "highlight_square", [self])
	self.connect("pressed", get_parent(), "line_lookup", [self])
	self.connect("pressed", get_parent(), "column_lookup", [self])


