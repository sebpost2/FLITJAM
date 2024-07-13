extends CharacterBody2D

var direction=Vector2.RIGHT
var speed=1000
#var velocity: Vector2 = Vector2(350, 0)

@export var attack_damage := 10.0
@export var knockback_force := 100.0
var gravity = 1200
var time_passed = 0.0
#var speed = 300.0  # Initial speed of the projectile
var angle = -40.0   # Launch angle in degrees
func _ready():
	var radians = deg_to_rad(angle)
	#self.velocity.x = PlayerGlobal.last_direction_x*speed
	velocity = Vector2(cos(radians)*PlayerGlobal.last_direction_x, sin(radians)) * speed
	
func _process(delta):
	velocity.y += gravity * delta
	position += velocity * delta
	rotation = velocity.angle()

func _on_proyectile_visibility_screen_exited():
	#print("Exited bullet")
	#queue_free()
	pass

func _on_proyectil_area_area_entered(area):
	if area is HitboxComponente:
		var attack=Attack.new()
		
		attack.attack_damage=attack_damage
		attack.knockback_force=knockback_force
		attack.attack_position=global_position
		area.damage(attack)
