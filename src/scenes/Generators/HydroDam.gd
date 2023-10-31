extends './Generator.gd'

class_name HydroDamGenerator

# Called when the node enters the scene tree for the first time.
func _ready():
	self.generator_name = "Hydro Dam"
	self.cost = 1000
	self.points_per_second = 50
	self.set_generator_name_label()
	self.set_cost_label()
