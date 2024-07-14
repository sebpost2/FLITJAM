extends Node2D
var player = preload("res://Jugadores/Alpacas/Escenas/Alpaca.tscn")
@export var turn = 0

@onready var timerTurnosLlama = $TimerTurnosLlama
@onready var timerTurnosCuy = $TimerTurnosCuy
@onready var timerText = $UI/Temporizador/RichTextLabel
@onready var timerScene = $Scene

@onready var animateLlama = $UI/TurnAnimated/Llama/AnimationPlayer
@onready var animateCuy = $UI/TurnAnimated/Cuy/AnimationPlayer
@onready var animateWinner = $UI/WinnerScene/AnimationPlayer

@onready var llama = $Llamas
@onready var cuy = $Cuys

@onready var Destello = $UI/WinnerScene/ColorRect

var time_left



func inst(pos):
	var instance = player.instantiate()
	instance.position = pos
	add_child(instance)
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN) 
	time_left = 31
	update_timer_text()
	animateLlama.play("LlamaTurnOpen")
	$AudioStreamPlayer.play()

func _process(delta):
	if get_node("TileMap") != null and timerTurnosCuy.is_stopped() == false:
		time_left -= delta
		update_timer_text()
	if get_node("TileMap") != null and timerTurnosLlama.is_stopped() == false:
		time_left -= delta
		update_timer_text()
	if get_node("TileMap") != null and llama.shoot == true:
		llama.shoot = false
		timerTurnosLlama.stop()
		_on_timer_turnos_timeout()
	if get_node("TileMap") != null and  cuy.shoot == true:
		cuy.shoot = false
		timerTurnosCuy.stop()
		_on_timer_turnos_cuy_timeout()
	if get_node("TileMap") != null and  cuy.NumCuys == 0:
		winner("Llama")
	if get_node("TileMap") != null and llama.NumAlpaca == 0:
		winner("Cuy")
		
	

func _on_timer_turnos_timeout():
	if(get_node("TileMap") == null):
		return
	print("TIMEOUT-LLAMA")
	turn += 1;
	time_left = 31
	timerScene.start()
	changeTurnAnimated()
	
func _on_timer_turnos_cuy_timeout():
	if(get_node("TileMap") == null):
		return
	print("TIMEOUT-CUY")
	turn += 1;
	time_left = 31
	timerScene.start()
	changeTurnAnimated()
	

	
func update_timer_text():
	if(get_node("TileMap") == null):
		return
	var minutes = int(time_left) / 60
	var seconds = int(time_left) % 60

	
	var minutes_str = str(minutes).pad_zeros(2)
	var seconds_str = str(seconds).pad_zeros(2)
	
	
	timerText.text = minutes_str + ":" + seconds_str
	
func _on_scene_timeout():
	if(get_node("TileMap") == null):
		return
	if(turn%2 == 0):
		timerTurnosLlama.start()
	else:
		timerTurnosCuy.start()
	 


func changeTurnAnimated():
	if(get_node("TileMap") == null):
		return
	if(turn%2 == 0):
		animateLlama.play("LlamaTurnOpen")
	else:
		animateCuy.play("CuyTurnOpen")
		
func winner(ganador):
	var numLLamas =get_node("Llamas").NumAlpaca
	var numCuys =get_node("Cuys").NumCuys
	animateWinner.play("Destello")
	get_node("TileMap").queue_free()
	get_node("Llamas").queue_free()
	get_node("Cuys").queue_free()
	get_node("UI").get_node("Temporizador").queue_free()
	get_node("UI").get_node("TurnAnimated").queue_free()
	if(ganador == "Cuy"):
		animateWinner.play("CuyWinner")
		animateWinner.queue("CuyDance")
		
	else:
		animateWinner.play("LlamaWin")
		animateWinner.queue("LlamaDance")
	if(numCuys == 3	 or numLLamas == 3):
		var tween = create_tween()
			#tween.tween_property(get_node("UI").get_node("WinnerScene").get_node("Trofeo"), "position", Vector2(500, 300), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		print(get_node("UI").get_node("WinnerScene").get_node("Trofeo").name)
		var coloranter= get_node("UI").get_node("WinnerScene").get_node("Trofeo").modulate
		tween.tween_property(get_node("UI").get_node("WinnerScene").get_node("Trofeo"), "modulate", Color(coloranter.r,coloranter.g,coloranter.b,1) ,1)
		
	var tween = create_tween()
			#tween.tween_property(get_node("UI").get_node("WinnerScene").get_node("Trofeo"), "position", Vector2(500, 300), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)

	var coloranter= get_node("UI").get_node("WinnerScene").get_node("GameOver").modulate
	tween.tween_property(get_node("UI").get_node("WinnerScene").get_node("GameOver"), "modulate", Color(coloranter.r,coloranter.g,coloranter.b,1) ,1)
	
