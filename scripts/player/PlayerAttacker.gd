extends Area3D

@onready var signal_bus: SignalBus = get_node("/root/SignalBus")
@onready var weapon_manager: WeaponManager = get_node("/root/PlayerData/WeaponManager")
@onready var projectile_container = get_node("/root/Containers/Projectiles")

var item_hold: float = 0

func _ready():
	signal_bus.player_attack.connect(_player_attack)

func _physics_process(delta):

	if Input.is_action_just_pressed("use_item"):
		signal_bus.player_attack_start.emit()
		item_hold = 0

	if Input.is_action_pressed("use_item"):
		item_hold += delta

	if Input.is_action_just_released("use_item"):
		signal_bus.player_attack.emit(item_hold)
		item_hold = 0

func _player_attack(hold_time: float):
	var cur_weapon = weapon_manager.get_current_weapon()
	if cur_weapon is MeleeWeapon:
		for area in get_overlapping_areas():
			if area is EnemyHitBox:
				print("hit enemy")
				area.hit()

	elif cur_weapon is RangedWeapon:
		if cur_weapon.projectile != null:
			var inst = cur_weapon.projectile.instantiate()
			inst.init(owner.camera_dir())
			inst.global_position = global_position
			projectile_container.add_child(inst)


