extends TextureRect

var original_y;
var bounce_range = 10
var moving_up = true
var main_node
var popup_node
var popup_timer_node
var unlocked = false

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
	# TODO: Refactor code to better generate popups, rather than a large amount of if statements
	if (event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed):
		if !unlocked:
			self.unlocked = true
			if (self.name == "WindTurbineInfoAlert"):
				popup_node.set_title("Wind Turbine")
				popup_node.set_text("Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text ")
				popup_node.set_source_link("www.google.ca")
			elif (self.name == "SolarPanelInfoAlert"):
				popup_node.set_title("Solar Panel")
				popup_node.set_text("Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text ")
				popup_node.set_source_link("www.google.ca")
			elif (self.name == "ReforestationInfoAlert"):
				popup_node.set_title("Reforestation")
				popup_node.set_text("Reforestation is like planting a lot of new trees in places where they were cut down or where they didn't grow before. It's like giving the Earth more green, leafy friends.")
				popup_node.set_source_link("www.google.ca")
		else:
			if (self.name == "WindTurbineInfoAlert"):
				popup_node.set_title("Wind Turbine")
				popup_node.set_text("Wind")
				popup_node.set_source_link("www.google.ca")
			elif (self.name == "SolarPanelInfoAlert"):
				popup_node.set_title("Solar Panel")
				popup_node.set_text("Solar")
				popup_node.set_source_link("www.google.ca")
			elif (self.name == "ReforestationInfoAlert"):
				popup_node.set_title("Reforestation")
				popup_node.set_text("Refor")
				popup_node.set_source_link("www.google.ca")
		popup_timer_node.start(1)
		popup_node.show()
		self.hide()


func _on_timer_timeout():
	if self.unlocked:
		self.show()
