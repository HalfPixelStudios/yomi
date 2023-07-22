class_name EnemyAttacker extends Area3D

# Enemy Melee Attacks

signal attack()

func _ready():
	attack.connect(_attack)

func _attack():
	for area in get_overlapping_areas():
		if area is PlayerHitBox:
			# print("hit player")
			area.hit()

