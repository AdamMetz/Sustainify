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
				popup_node.set_text("Tall machines called wind turbines turn wind power from the wind into electricity. The turbines have spinning blades, which the wind causes to spin. This spinning helps create power for things like homes and buildings.")
				popup_node.set_source_link("https://kids.britannica.com/kids/article/wind-power/574607")
			elif (self.name == "SolarPanelInfoAlert"):
				popup_node.set_title("Solar Panel")
				popup_node.set_text("Solar panels are devices that turn sunlight into electricity, providing a clean and renewable energy source for many different applications.")
				popup_node.set_source_link("https://kids.earth.org/climate-change/what-is-solar-energy/")
			elif (self.name == "ReforestationInfoAlert"):
				popup_node.set_title("Reforestation")
				popup_node.set_text("Reforestation is the process of planting trees in areas where they were cut down or removed. It aims to restore and replenish forests that may have been lost due to logging, wildfires, or other reasons.")
				popup_node.set_source_link("https://www.britannica.com/science/reforestation")
		else:
			if (self.name == "WindTurbineInfoAlert"):
				popup_node.set_title("Wind Turbine")
				popup_node.set_text("Contrarily to fossil fuel, generating wind electricity is an environmentally friendly process that does not emit any greenhouse gases")
				popup_node.set_source_link("https://kids.earth.org/climate-change/what-is-wind-energy/")
			elif (self.name == "SolarPanelInfoAlert"):
				popup_node.set_title("Solar Panel")
				popup_node.set_text("Energy from the sun is called solar energy, and is a renewable energy source. This kind of energy is special because it never runs out. We call it a 'renewable' energy source because we can keep using it again and again.")
				popup_node.set_source_link("https://kids.earth.org/climate-change/what-is-solar-energy/")
			elif (self.name == "ReforestationInfoAlert"):
				popup_node.set_title("Reforestation")
				popup_node.set_text("Trees help to remove a gas called carbon dioxide from the air. This gas can cause the Earth to warm up, so the trees are helpful for working against climate change.")
				popup_node.set_source_link("https://www.britannica.com/science/reforestation")
		popup_timer_node.start(1)
		popup_node.show()
		self.hide()


func _on_timer_timeout():
	if self.unlocked:
		self.show()
