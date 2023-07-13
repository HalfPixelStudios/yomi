extends Node3D

@export var cooldown: float
@export var dash_distance: float = 3
@export var dash_time: float = 0.2

# fov when dashing
@export var dash_fov: float = 60

func _physics_process(delta):
	if Input.is_action_just_pressed("ability"):

		var facing = owner.velocity.normalized()
		if facing == Vector3.ZERO:
			facing = owner.camera_dir()
		var target = global_position + facing * dash_distance

		var original_fov = owner.camera.fov

		var tween = create_tween()
		tween.tween_property(owner, "global_position", target, dash_time).set_ease(Tween.EASE_IN_OUT)
		tween.tween_callback(_dash_finished)

		# var cam_tween = create_tween()
		# cam_tween.tween_property(owner.camera, "fov", dash_fov, dash_time / 2.0).set_ease(Tween.EASE_IN)
		# cam_tween.tween_property(owner.camera, "fov", original_fov, dash_time / 2.0).set_ease(Tween.EASE_OUT)

	# owner.move_and_slide()

func _dash_finished():
	pass

