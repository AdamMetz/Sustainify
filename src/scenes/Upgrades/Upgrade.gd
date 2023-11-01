extends HBoxContainer

class_name BaseUpgrade

signal upgrade_purchased

# Properties #

var upgrade_name : String # Must be a unique property
var cost : int
var number_owned : int = 0
var purchase_limit : int
var cost_increase_growth_factor : int = 10

# Constructor #

func init(upgrade_name : String, upgrade_cost : int, upgrade_purchase_limit : int):
	self.upgrade_name = upgrade_name
	self.cost = upgrade_cost
	self.purchase_limit = upgrade_purchase_limit
	# Setup label nodes
	self.set_upgrade_name_label()
	self.set_cost_label()
	self.set_number_owned_label()

# Setters & Getters #

func get_upgrade_name() -> String: return self.upgrade_name

func set_cost(new_cost : int): self.cost = new_cost
func get_cost() -> int: return self.cost

func get_purchase_limit() -> int: return self.purchase_limit

func get_number_owned() -> int: return self.number_owned

# Cost & Number Owned Updaters #

func update_cost():
	self.cost = cost * cost_increase_growth_factor
	set_cost_label()
	
func update_number_owned():
	self.number_owned += 1
	set_number_owned_label()

# Label Setters #

func set_cost_label():
	var cost_label_node = self.get_node("NameAndCostContainer/CostContainer/CostLabel")
	cost_label_node.text = str(self.cost)
	
func set_upgrade_name_label():
	var upgrade_name_label_node = self.get_node("NameAndCostContainer/NameLabel")
	upgrade_name_label_node.text = self.upgrade_name
	
func set_number_owned_label():
	var number_owned_label_node = self.get_node("NumberOwnedLabel")
	number_owned_label_node.text = str(self.number_owned) + "/" + str(self.purchase_limit)

# Signals #

func _on_gui_input(event):
	if (event is InputEventMouseButton):
		if (event.button_index == MOUSE_BUTTON_LEFT and event.pressed):
			var main_node = get_node("../../../../Main")
			if (main_node.sustainability_points >= self.cost):
				print(self.upgrade_name) # Debugging
				emit_signal("upgrade_purchased", self)
				update_cost()
				update_number_owned()
			else:
				print("Cannot afford") # Debugging
