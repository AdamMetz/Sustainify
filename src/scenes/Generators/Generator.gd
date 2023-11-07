extends HBoxContainer

class_name BaseGenerator

signal generator_purchased

# Properties #

var generator_name : String # Must be a unique property
var cost : int
var points_per_second : int
var number_owned : int = 0
var cost_increase_growth_factor : float = 1.15

# Constructor #

func init(gen_name : String, gen_cost : int, gen_points_per_second : int):
	self.generator_name = gen_name
	self.cost = gen_cost
	self.points_per_second = gen_points_per_second
	# Setup label nodes
	self.set_generator_name_label()
	self.set_cost_label()
	self.set_points_per_second_label()

# Setters & Getters #

func get_generator_name() -> String: return self.generator_name

func get_cost() -> int: return self.cost

func get_points_per_second() -> int: return self.points_per_second

func get_number_owned() -> int: return self.number_owned

func get_cost_increase_growth_factor() -> float: return self.cost_increase_growth_factor

# Updaters #

func update_cost():
	self.cost = ceil(cost * cost_increase_growth_factor)
	set_cost_label()
	
func update_number_owned():
	self.number_owned += 1
	set_number_owned_label()

# Upgrade Functionality #

func upgrade(points_multiplier : int):
	self.points_per_second *= points_multiplier
	set_points_per_second_label()

# Label Setters #

func set_cost_label():
	var cost_label_node = self.get_node("NameAndCostContainer/CostContainer/CostLabel")
	cost_label_node.text = str(self.cost)
	
func set_generator_name_label():
	var generator_name_label_node = self.get_node("NameAndCostContainer/GeneratorName")
	generator_name_label_node.text = self.generator_name
	
func set_number_owned_label():
	var number_owned_label_node = self.get_node("NumberOwnedAndPointsPerSecondContainer/NumberGeneratorOwnedLabel")
	number_owned_label_node.text = str(self.number_owned) + "x"
	
func set_points_per_second_label():
	var points_per_second_label_node = self.get_node("NumberOwnedAndPointsPerSecondContainer/PointsPerSecondLabel")
	points_per_second_label_node.text = "+" + str(self.points_per_second) + "/s"

# Signals #

func _on_gui_input(event):
	if (event is InputEventMouseButton):
		if (event.button_index == MOUSE_BUTTON_LEFT and event.pressed):
			var main_node = get_node("../../../../Main")
			if (main_node.sustainability_points >= self.cost):
				print(self.generator_name) # Debugging
				emit_signal("generator_purchased", self)
				update_cost()
				update_number_owned()
			else:
				print("Cannot afford") # Debugging
