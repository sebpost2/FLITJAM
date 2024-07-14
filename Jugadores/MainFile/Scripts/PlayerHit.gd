extends State
class_name HitState

@onready var EnemySprite:Sprite2D=$"../../PlayerSprites"
@onready var Timer1:Timer=$StunTime
@onready var Machine:StateMachine=$".."
@onready var HitboxCollider:CollisionShape2D=$"../../HitboxComponente/HitboxPlayer"
@onready var PlayAnim:AnimationPlayer=$"../../AnimationPlayer"

func Enter():
	HitboxCollider.disabled=true
	PlayAnim.play("Player_hit")
	print("AAAAAAAAAAA" + str(get_parent().get_parent().get_node("VidaComponente").vida))
	if(get_parent().get_parent().get_node("VidaComponente").vida == 10000):
		get_parent().get_parent().get_node("Vida").get_node("Sprite2D3").visible = false
	if(get_parent().get_parent().get_node("VidaComponente").vida == 5000):
		get_parent().get_parent().get_node("Vida").get_node("Sprite2D2").visible = false

func Update(_delta: float):
	EnemySprite.modulate=Color(1,0,0,1)

func _on_vida_componente_hit():
	Timer1.start()
	Transitioned.emit(Machine._curr_state(),"PlayerHit")

func _on_stun_time_timeout():
	HitboxCollider.disabled=false
	EnemySprite.modulate=Color(1,1,1,1)
	Transitioned.emit(self,"PlayerIdle")
