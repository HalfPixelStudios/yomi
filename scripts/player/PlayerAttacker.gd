extends Area3D

@onready var signal_bus = get_node("/root/SignalBus")

func _ready():
	signal_bus.player_attack.connect(_player_attack)

func _player_attack():
	for area in get_overlapping_areas():
		if area is EnemyHitBox:
			print("hit enemy")
