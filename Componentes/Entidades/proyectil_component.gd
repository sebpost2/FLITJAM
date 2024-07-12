extends Area2D

var direction=Vector2.RIGHT
var speed=400

@export var attack_damage := 10.0
@export var knockback_force := 100.0
const DEG_TO_RAD = PI / 180.0
var initial_position = Vector2()
var initial_velocity = Vector2()
#var gravity = 9.8
var time_passed = 0.0
#                       xdvar speed = 300.0  # Initial speed of the projectile
var angle = 45.0   # Launch angle in degrees

func _process(delta):
	#translate(direction.normalized()*speed*delta)
	time_passed += delta
	initial_velocity.y = -speed * sin(angle * DEG_TO_RAD)
	#var new_x = initial_position.x + initial_velocity.x * time_passed
	var new_y = initial_position.y + initial_velocity.y * time_passed + 0.5 * gravity * pow(time_passed, 2)
	#self.position.x = new_x
	self.position.y = new_y

func _on_proyectile_visibility_screen_exited():
	#print("Exited bullet")
	#queue_free()
	pass

func _on_area_entered(area):
	if area is HitboxComponente:
		var attack=Attack.new()
		
		attack.attack_damage=attack_damage
		attack.knockback_force=knockback_force
		attack.attack_position=global_position
		area.damage(attack)
