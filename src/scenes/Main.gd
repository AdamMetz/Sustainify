extends Control

var sustainabilityPoints : int = 0
var pointsPerClick : int = 1
var pointsPerSecond : int = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func updatePoints(points : int):
	if (sustainabilityPoints + points >= 0):
		sustainabilityPoints += points
		$Label.text = str(sustainabilityPoints)
	

func _on_clicker_button_button_down():
	updatePoints(pointsPerClick)


func _on_timer_timeout():
	updatePoints(pointsPerSecond)
