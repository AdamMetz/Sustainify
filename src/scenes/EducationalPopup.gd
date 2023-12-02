extends TextureRect

var allow_continue = false

func _on_gui_input(event):
	if (allow_continue and event is InputEventMouseButton):
		if (event.button_index == MOUSE_BUTTON_LEFT and event.pressed):
			allow_continue = false
			self.hide()

func _on_timer_timeout():
	allow_continue = true
