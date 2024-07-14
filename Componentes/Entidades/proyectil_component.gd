extends CharacterBody2D

var direction=Vector2.RIGHT
var speed= 800
#var velocity: Vector2 = Vector2(350, 0)

@export var attack_damage := 5000.0
@export var knockback_force := 20.0
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

func delete():
	#print("Exited bullet")
	queue_free()
	pass

func _on_proyectil_area_area_entered(area):
	if area is HitboxComponente:
		var attack=Attack.new()
		attack.attack_damage=attack_damage
		attack.knockback_force=knockback_force
		attack.attack_position=global_position
		area.damage(attack)
		get_parent().get_node("Mundo").get_node("TileMap").handle_missile_impact(self.position.x/16, self.position.y/16,3.5)
		delete()
		
func _on_proyectil_area_body_entered(body):
	if(body.name == "TileMap"):
		get_parent().get_node("Mundo").get_node("TileMap").handle_missile_impact(self.position.x/16, self.position.y/16,3.5)
		#get_parent().get_node("Mundo").get_node("TileMap").handle_missile_impact(10, 20,3)
		delete()
	

