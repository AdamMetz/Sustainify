extends Control

var sustainability_points : int = 0
var points_per_click : int = 1
var points_per_second : int = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	for generator in $GeneratorsPanelBackground/GeneratorsContainer.get_children():
		if generator is BaseGenerator:
			generator.generator_purchased.connect(on_generator_purchased)
	update_points(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update_points(pointsDelta : int):
	if (sustainability_points + pointsDelta >= 0):
		sustainability_points += pointsDelta
		$PointDisplay.text = str(sustainability_points)

func update_points_per_second(points_per_second_delta: int):
	points_per_second += points_per_second_delta

func _on_clicker_button_button_down():
	update_points(points_per_click)

func _on_timer_timeout():
	update_points(points_per_second)

func on_generator_purchased(generator : BaseGenerator):
	update_points_per_second(generator.get_points_per_second())
	update_points(-generator.get_cost())
