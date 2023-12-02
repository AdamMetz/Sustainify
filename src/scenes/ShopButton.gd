extends TextureButton

var generator_node
var main_node

# Called when the node enters the scene tree for the first time.
func _ready():
	generator_node = get_parent().get_parent()
	main_node = get_node("/root/Main")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (self.disabled and main_node.sustainability_points >= generator_node.get_cost()):
		self.disabled = false
	elif (!self.disabled and main_node.sustainability_points < generator_node.get_cost()):
		self.disabled = true
