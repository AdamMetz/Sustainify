extends TextureRect

var original_y;
var bounce_range = 10
var moving_up = true
var main_node
var popup_node
var popup_timer_node

# Called when the node enters the scene tree for the first time.
func _ready():
	original_y = self.position.y
	main_node = get_node("/root/Main")
	popup_node = main_node.get_node("EducationalPopup")
	popup_timer_node = popup_node.get_child(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var movement_amount = 18 * delta
	if (moving_up):
		if (self.position.y + movement_amount < original_y + bounce_range):
			self.position.y += movement_amount
		else: moving_up = false
	else:
		if (self.position.y - movement_amount > original_y):
			self.position.y -= movement_amount
		else: moving_up = true	

func _on_gui_input(event):
	if (event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed):
		self.hide()
		popup_timer_node.start(1)
		popup_node.show()
