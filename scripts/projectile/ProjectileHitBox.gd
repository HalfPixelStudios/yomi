class_name ProjectileHitBox extends Area3D

func _ready():
	area_entered.connect(_area_entered)

	# TODO programatically set collision layers based on who owner of projectile is
	set_collision_mask_value(3, true)
	set_collision_mask_value(4, true)

func _area_entered(area):
	if area is EnemyHitBox:
		area.owner.on_hit.emit() # notify target that it was hit
		owner.on_hit.emit() # notify self that we hit something
		print("collide enemy")


