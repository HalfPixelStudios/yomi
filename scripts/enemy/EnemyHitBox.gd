class_name EnemyHitBox extends Area3D

func hit():
	owner.on_hit.emit()



