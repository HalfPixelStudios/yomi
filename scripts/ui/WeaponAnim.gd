class_name WeaponAnim extends Control

@onready var anim = $Animation

@onready var signal_bus = get_node("/root/SignalBus")

func _ready():
	signal_bus.player_attack.connect(_player_attack)
	signal_bus.player_attack_start.connect(_player_attack_start)

func _player_attack_start():
	if anim.has_animation("AttackStart"):
		print("attack start")
		anim.play("AttackStart")

func _player_attack(hold_time: float):
	if anim.has_animation("Attack"):
		anim.play("Attack")
