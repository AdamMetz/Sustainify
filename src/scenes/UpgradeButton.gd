extends TextureButton

var upgrade_node
var main_node

# Called when the node enters the scene tree for the first time.
func _ready():
	upgrade_node = get_parent().get_parent()
	main_node = get_node("/root/Main")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (upgrade_node.get_number_owned() == 5):
		self.disabled = true
		return
	if (self.disabled and main_node.sustainability_points >= upgrade_node.get_cost()):
		self.disabled = false
	elif (!self.disabled and main_node.sustainability_points < upgrade_node.get_cost()):
		self.disabled = true
