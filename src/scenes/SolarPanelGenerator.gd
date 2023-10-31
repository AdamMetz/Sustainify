extends './Generator.gd'

class_name SolarPanelGenerator

# Called when the node enters the scene tree for the first time.
func _ready():
	self.generator_name = "Solar Panel"
	self.cost = 100
	self.points_per_second = 10
	self.set_generator_name_label()
