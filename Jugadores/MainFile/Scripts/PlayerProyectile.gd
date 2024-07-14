extends State
class_name PlayerProyectile

var bullet_scene = preload("res://Componentes/Entidades/proyectil_component.tscn")
var direction_x=0
var Shooting:bool=1
@export var cooldown=2
@onready var timer=$ProyectileCooldown

func cool_down(dur):
	timer.wait_time=dur
	timer.start()
	
func is_cooldown():
	return !timer.is_stopped()

func Enter():
	Shooting=1
	if(get_parent().get_parent().canMove == true):	
		get_parent().get_parent().get_parent().shoot = true
		cool_down(cooldown)
		var bullet=bullet_scene.instantiate()
		
		#El trayecto de la bala ahora se cambia en proyectil_component, aqui solo se crea la instancia de la bala
			
		if(PlayerGlobal.last_direction_x == 1):
			#bullet.direction=Vector2.RIGHT
			$Bulletposition.position.x=15
		elif(PlayerGlobal.last_direction_x==-1):
			#bullet.direction=Vector2.LEFT
			$Bulletposition.position.x=-15
		bullet.global_position=$Bulletposition.global_position
		get_tree().get_root().add_child(bullet)
		if($Disparo != null):
			$Disparo.play()
	Shooting=0

func Update(_delta: float):
	if !Shooting:
		Transitioned.emit(self,"PlayerIdle")
	pass
