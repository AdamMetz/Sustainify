extends TextureRect

# Speed at which the cloud moves
var speed = 70
var moving_right

# Called when the node enters the scene tree for the first time.
func _ready():
	moving_right = randi() % 2 == 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (moving_right):
		self.position.x += delta * speed

		# Check if the cloud is off-screen, then reset its position
		if self.position.x > get_viewport_rect().size.x:
			self.position.x = -200
	else:
		self.position.x -= delta * speed

		# Check if the cloud is off-screen, then reset its position
		if self.position.x < 0 - 200:
			self.position.x = get_viewport_rect().size.x + 200
