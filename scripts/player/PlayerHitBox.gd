class_name PlayerHitBox extends Area3D

func hit():
	owner.on_hit.emit()
