extends Area3D

@onready var signal_bus: SignalBus = get_node("/root/SignalBus")
@onready var weapon_manager: WeaponManager = get_node("/root/PlayerData/WeaponManager")
@onready var projectile_container = get_node("/root/Containers/Projectiles")

func _ready():
	signal_bus.player_attack.connect(_player_attack)

func _player_attack():
	var cur_weapon = weapon_manager.get_current_weapon()
	if cur_weapon is MeleeWeapon:
		for area in get_overlapping_areas():
			if area is EnemyHitBox:
				print("hit enemy")
				area.hit()

	elif cur_weapon is RangedWeapon:
		var inst = cur_weapon.projectile.instantiate()
		inst.init(owner.camera_dir())
		inst.global_position = global_position
		projectile_container.add_child(inst)


