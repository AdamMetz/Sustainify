extends './Generator.gd'

class_name WindTurbineGenerator

# Called when the node enters the scene tree for the first time.
func _ready():
	self.generator_name = "Wind Turbine"
	self.cost = 10
	self.points_per_second = 5
	self.set_generator_name_label()
	self.set_cost_label()
