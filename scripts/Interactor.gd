class_name Interactor extends Area3D

func _physics_process(delta):
	for area in get_overlapping_areas():
		if area is Interactable:
			pass
