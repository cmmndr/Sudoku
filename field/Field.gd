extends Control

var field = []
var highlighted_square: Button = null
var _timer = null
  




# Called when the node enters the scene tree for the first time.
func _ready():
	_timer = Timer.new()
	add_child(_timer)
	_timer.connect("timeout", self, "_on_Timer_timeout")
	_timer.set_wait_time(1.0)
	_timer.set_one_shot(false) # Make sure it loops
	_timer.start()
	init_field()
	#print(field)
	


func init_field():
	for x in range(9):
		field.append([])
		for y in range(9):
			field[x].append("0")
	fill_field()
	for button in field:
		for i in range(9):
			if button[i].is_disabled():
				button[i].add_color_override("font_color_disabled", Color(1,1,0,1))


func fill_field():
	for i in range (9):
		for j in range(9):
			var current_child = get_child(i*9+j)
			field[j][i] = current_child
			var text = current_child.get_text()
			if text != "":
				current_child.set_disabled(true)
	
func check_field():
	pass

func highlight_square(node):
	if(highlighted_square == null):
		highlighted_square = node
	else:
		highlighted_square.pressed = false
		highlighted_square = node


func change_number(number, node):
	if(highlighted_square != null):
		highlighted_square.set_text(number)
		has_column_duplicate(number)
		has_line_duplicate(number)
		#has_box_duplicate()


func check_box():
	pass
	
func has_line_duplicate(number):
	var lin = line_lookup(highlighted_square)
	var line = field[lin]
	print(line)
	if line.count(number) > 1:
		print("true")
		return true
	else:
		print("false")
		return false

func has_column_duplicate(number):
	var col = column_lookup(highlighted_square)
	var column = field[col]
	print(column)
	if column.count(number) > 1:
		print("true")
		return true
	else:
		print("false")
		return false


func line_lookup(node):
	var line
	for y in range(9):
		for x in range(9):
			if(field[x][y] == node):
				line = x 
	print("zeile: ", line)
	return line
	
func column_lookup(node):
	var column
	for y in range(9):
		for x in range(9):
			if(field[x][y] == node):
				column = y 
	print("spalte: ", column)
	return column


func vertical_field_separator(field):
	var column_list = []
	for i in range(9):
		var column = []
		for j in range(9):
			if(field[j][i].get_text() == ""):
				column.append("0")
			else:
				column.append(field[j][i].get_text())
			if(j==8):
				column_list.append(column)
	return column_list

func horizontal_field_separator(field):
	var line_list = []
	for i in range(9):
		var line = []
		for j in range(9):
			if(field[i][j].get_text() == ""):
				line.append("0")
			else:
				line.append(field[i][j].get_text())
			if(j==8):
				line_list.append(line)
	return line_list


func _on_Timer_timeout():
	pass   
	#print(highlighted_square)
