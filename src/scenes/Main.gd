extends Control

var sustainability_points : int = 0
var points_per_click : int = 1
var points_per_second : int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	var generators = [] 
	for generator in $GeneratorsPanelBackground/GeneratorsContainer.get_children():
		if generator is BaseGenerator:
			generator.generator_purchased.connect(on_generator_purchased)
			generators.append(generator)
	for upgrade in $UpgradesPanelBackground/UpgradesContainer.get_children():
		if upgrade is BaseUpgrade:
			upgrade.upgrade_purchased.connect(on_upgrade_purchased)
			# Connect the upgrade to its associated generator
			for generator in generators:
				if generator.get_generator_name() == upgrade.get_associated_generator_name():
					upgrade.associated_generator = generator
					break
		
	update_points(sustainability_points)
	update_points_per_second(points_per_second)

func update_points(pointsDelta : int):
	if (sustainability_points + pointsDelta >= 0):
		sustainability_points += pointsDelta
		$PointsLabel.text = str(sustainability_points)

func update_points_per_second(points_per_second_delta: int):
	points_per_second += points_per_second_delta
	$PointsPerSecondLabel.text = "+" + str(points_per_second) + "/second"

func _on_clicker_button_button_down():
	update_points(points_per_click)

func _on_timer_timeout():
	update_points(points_per_second)

func on_generator_purchased(generator : BaseGenerator):
	update_points_per_second(generator.get_points_per_second())
	update_points(-generator.get_cost())
	
func on_upgrade_purchased(upgrade : BaseUpgrade):
	print(-upgrade.get_cost())
	update_points(-upgrade.get_cost())
	if upgrade.get_upgrade_name() == "Better Clicks":		
		points_per_click *= 2
		return
	var upgraded_generator = upgrade.get_associated_generator()
	var points_per_second_increase : int = (
		upgraded_generator.get_number_owned() * upgraded_generator.get_points_per_second() 
		/ upgrade.get_upgrade_multiplier()
	)
	update_points_per_second(points_per_second_increase)
