extends CharacterBody3D

@export var movement_speed: float = 5.0

# TODO move this to shared constants file
const gravity: float = 8.0

func _physics_process(delta):

	var input = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	var move_dir = (transform.basis * Vector3(input.x, 0, input.y)).normalized()
	if move_dir:
		velocity.x = move_dir.x * movement_speed
		velocity.z = move_dir.z * movement_speed
	else:
		velocity.x = 0.0
		velocity.z = 0.0

	move_and_slide()



