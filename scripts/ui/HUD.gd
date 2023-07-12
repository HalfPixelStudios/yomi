extends Control

@onready var weapon_anim: Node = $WeaponAnim

@onready var signal_bus = get_node("/root/SignalBus")

func _ready():
	signal_bus.player_switch_weapon.connect(_player_switch_weapon)

func _player_switch_weapon(new_weapon: Weapon):
	var inst = new_weapon.hud_anim.instantiate()
	weapon_anim.queue_free()
	weapon_anim = inst
	add_child(inst)
