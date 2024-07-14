extends Node2D


@onready var soundPlay = $AudioPlay
var flag = false
func _ready():
	#MusicaFondo.button_click()
	$AudioPlay.play()
	
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN) 
	$VBoxContainer/botonStart.grab_focus()
	
func _process(delta):
	if $VBoxContainer/botonStart.has_focus() == true:
		if flag == false:
			print("asd")
			flag = !flag
			$Botones.play()
		$VBoxContainer/chancla.position = Vector2(1700,100)
	if $VBoxContainer/botonQuit.has_focus() == true:
		if flag == true:
			flag = !flag
			$Botones.play()
		$VBoxContainer/chancla.position = Vector2(1700,750)
	if $VBoxContainer/datos.has_focus() == true:
		if flag == true:
			flag = !flag
			$Botones.play()
		$VBoxContainer/chancla.position = Vector2(275,450)

func _on_boton_start_pressed():
	#soundPlay.playing=true
	#await get_tree().create_timer(2.05).timeout
	
	get_tree().change_scene_to_file("res://Mundo/mundo.tscn")
	
	
	# Poner la escena del juego
	#get_tree().change_scene_to_file("res://Scenes/mundo.tscn")
func _on_boton_quit_pressed():
	get_tree().quit()
	


func _on_datos_pressed():
	get_node("VBoxContainer/datos").get_node("ColorRect").visible = !get_node("VBoxContainer/datos").get_node("ColorRect").visible
	get_node("VBoxContainer/datos").get_node("RichTextLabel").visible = !get_node("VBoxContainer/datos").get_node("RichTextLabel").visible
