extends './Generator.gd'

class_name WindTurbineGenerator

# Called when the node enters the scene tree for the first time.
func _ready():
	self.generatorName = "Wind Turbine"
	self.cost = 10
	self.pointsPerSecond = 5
	self.numberOwned = 0
	self.priceIncrease = 1.2
