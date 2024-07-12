extends TileMap


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var impact = Vector2(50 ,20)
	if Input.is_action_pressed("ui_select"):
		handle_missile_impact(impact.x, impact.y, 10)
		print("hi")
func handle_missile_impact(x, y, radius):
	
	for cell_x in range(int(x - radius), int(x + radius + 1)):
		for cell_y in range(int(y - radius), int(y + radius + 1)):
			var dist = sqrt(pow(cell_x - x, 2) + pow(cell_y - y, 2))
			if dist <= radius:
				erase_cell(0, Vector2(cell_x,cell_y))
