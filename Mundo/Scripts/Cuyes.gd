# Clase Character.gd

extends Node2D

# Definimos la clase
class_name Cuyes
var shoot = false
@export var NumCuys = 3
var currentCuy = 0
var player = preload("res://Jugadores/Cuys/Escenas/Cuy.tscn")


var speed = 200
var velocity = Vector2()


func _ready():
	
	#for x in NumCuys:
	#	inst(Vector2(700+200*x,200))
	inst(Vector2(950,50))
	inst(Vector2(1200,250))
	inst(Vector2(1200,600))
	get_child(0).canMove = true
	
		
		


func _physics_process(delta):
	if(NumCuys>0 and get_parent().turn%2 == 1):
		if(get_child(currentCuy%NumCuys).canMove == false):
			get_child(currentCuy%NumCuys).canMove = true
		if Input.is_action_just_pressed("nextAliado"):
			get_child(currentCuy%NumCuys).canMove = false
			currentCuy+=1
			get_child(currentCuy%NumCuys).canMove = true
	else:
		for x in NumCuys:
			if(get_child(x)!= null):
				get_child(x).canMove = false
			


		
func inst(pos):
	var instance = player.instantiate()
	instance.position = pos
	add_child(instance)
	
