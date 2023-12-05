extends TextureRect

var allow_continue = false
var title_node
var text_node
var source_link_node

# Called when the node enters the scene tree for the first time.
func _ready():
	title_node = get_node("EducationalPopupPanel/VBoxContainer/TitleLabel")
	text_node = get_node("EducationalPopupPanel/VBoxContainer/TextLabel")
	source_link_node = get_node("EducationalPopupPanel/SourceLinkButton")

func _on_gui_input(event):
	if (allow_continue and event is InputEventMouseButton):
		if (event.button_index == MOUSE_BUTTON_LEFT and event.pressed):
			allow_continue = false
			self.hide()

func _on_timer_timeout():
	allow_continue = true

func set_title(title: String):
	title_node.text = title

func set_text(text: String):
	text_node.text = text
	
func set_source_link(uri: String):
	source_link_node.uri = uri
