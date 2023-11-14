extends Popup

class_name EducationalPopup

var title_label : Label
var text_label : Label
var background_texture : TextureRect

func init(title : String, text : String):
	title_label.text = title
	text_label.text = text

# Called when the node enters the scene tree for the first time.
func _ready():
	title_label = Label.new()
	text_label = Label.new()
	background_texture = TextureRect.new()

	title_label.text = "Test"
	title_label.modulate = Color(0, 0, 0)
	text_label.text = "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit"
	#text_label.autowrap_mode = TextServer.AUTOWRAP_WORD
	text_label.modulate = Color(0, 0, 0)

	add_child(background_texture)
	add_child(title_label)
	add_child(text_label)

	background_texture.texture = preload("res://assets/UI-Background.png")

	popup_centered()
