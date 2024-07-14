# Clase Character.gd

extends Node2D

# Definimos la clase
class_name Alpaca
var shoot = false
@export var NumAlpaca = 3
var currentAlpaca = 0
var player = preload("res://Jugadores/Alpacas/Escenas/Alpaca.tscn")


var speed = 200
var velocity = Vector2()


func _ready():
	#for x in NumAlpaca:
	inst(Vector2(150, 600))
	inst(Vector2(200, 200))
	inst(Vector2(350, 200))
	get_child(0).canMove = true
		

func _physics_process(delta):
	
	if(NumAlpaca>0 and get_parent().turn%2 == 0):
		if(get_child(currentAlpaca%NumAlpaca).canMove == false):
			get_child(currentAlpaca%NumAlpaca).canMove = true
		if Input.is_action_just_pressed("nextAliado"):
			get_child(currentAlpaca%NumAlpaca).canMove = false
			currentAlpaca+=1
			get_child(currentAlpaca%NumAlpaca).canMove = true
			pass
	else:
		for x in NumAlpaca:
			if(get_child(x) != null):
				get_child(x).canMove = false
	
		


		
func inst(pos):
	var instance = player.instantiate()
	instance.position = pos
	add_child(instance)
	
