extends HBoxContainer

class_name BaseGenerator

signal generator_purchased

# Common properties
var generator_name : String # Must be a unique property
var cost : int
var points_per_second : int
var number_owned : int
var price_increase : float

func set_cost(new_cost : int): cost = new_cost

func _on_gui_input(event):
	if (event is InputEventMouseButton):
		if (event.button_index == MOUSE_BUTTON_LEFT and event.pressed):
			print(self.generator_name)
			emit_signal("generator_purchased", self)
