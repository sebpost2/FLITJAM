extends State
class_name DeadState

@onready var EnemySprite:Sprite2D=$"../../EnemySprites"
@export var Machine:StateMachine

func Enter():
	pass

func Update(_delta: float):
	pass

func _on_vida_componente_dead_player():
	print("Dead")
	Transitioned.emit(Machine._curr_state(),"DeadState")
	Enter()
