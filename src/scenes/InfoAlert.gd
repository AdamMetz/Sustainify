extends TextureRect

var original_y;
var bounce_range = 10
var moving_up = true

# Called when the node enters the scene tree for the first time.
func _ready():
	original_y = self.position.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var movement_amount = 18 * delta
	if (moving_up):
		if (self.position.y + movement_amount < original_y + bounce_range):
			self.position.y += movement_amount
		else: moving_up = false
	else:
		if (self.position.y - movement_amount > original_y):
			self.position.y -= movement_amount
		else: moving_up = true	
