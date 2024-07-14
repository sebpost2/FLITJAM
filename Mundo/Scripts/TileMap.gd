extends TileMap


@onready var sprite = $Sprite2D
@onready var animationPlayer = $AnimationPlayer




# Called when the node enters the scene tree for the first time.
func _ready():
	
	var child = load("res://Componentes/Entidades/proyectil_component.tscn")
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
		
		
		
func handle_missile_impact(x, y, radius):
	sprite.position = Vector2(x*16,y*16)
	animationPlayer.play("explosion")
	$Explosion.play()
	
	for cell_x in range(int(x - radius), int(x + radius + 1)):
		for cell_y in range(int(y - radius), int(y + radius + 1)):
			var dist = sqrt(pow(cell_x - x, 2) + pow(cell_y - y, 2))
			if dist <= radius:
				erase_cell(0, Vector2(cell_x,cell_y))
