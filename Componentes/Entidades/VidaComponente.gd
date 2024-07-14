extends Node2D
class_name VidaComponente

@export var MAX_VIDA := 10.0
@onready var HitStun:=$HitStun
var vida: float
signal DeadPlayer()
signal Hit()

func _ready():
	vida=MAX_VIDA
	
func damage(attack: Attack):
	#Hit.emit()
	get_parent().get_node("StateMachine").get_node("PlayerHit")._on_vida_componente_hit()
	vida -= attack.attack_damage

	if vida <=0:		
		#emit_signal("DeadPlayer")
		get_parent().get_node("StateMachine").get_node("DeadState")._on_vida_componente_dead_player()
		#DeadPlayer.emit	()

