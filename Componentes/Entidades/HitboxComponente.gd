extends Area2D
class_name HitboxComponente

@export var vida_componente : VidaComponente

func damage(attack:Attack):
	if vida_componente:
		vida_componente.damage(attack)

