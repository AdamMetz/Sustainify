extends './Generator.gd'

class_name SolarPanelGenerator

# Called when the node enters the scene tree for the first time.
func _ready():
	self.generatorName = "Solar Panel"
	self.cost = 100
	self.pointsPerSecond = 10
	self.numberOwned = 0
	self.priceIncrease = 1.2
