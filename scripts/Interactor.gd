class_name Interactor extends Area3D

func _physics_process(delta):

    if Input.is_action_just_pressed("interact"):
        for area in get_overlapping_areas():
            # TODO should find closest interactable
            if area is Interactable:
                print("interact")
                area.interact()
                break
