extends State
class_name DeadState

@onready var EnemySprite:Sprite2D=$"../../EnemySprites"
@export var Machine:StateMachine

func Enter():
	
	if(get_parent().get_parent().get_parent().name == "Llamas"):
		get_parent().get_parent().get_parent().NumAlpaca-=1	
	if(get_parent().get_parent().get_parent().name == "Cuys"):
		get_parent().get_parent().get_parent().NumCuys-=1
	get_parent().get_parent().queue_free()
	

func Update(_delta: float):
	pass

func _on_vida_componente_dead_player():
	Transitioned.emit(Machine._curr_state(),"DeadState")
	
