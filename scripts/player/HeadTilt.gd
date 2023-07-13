extends Node3D

# Tilt camera slightly when strafing

# Minimal velocity to trigger tilt
#@export var threshhold: float = 2.5

# Maximum tile angle (in degrees)
@export var tilt_angle: float = 2

# How long it takes to reach max tilt
@export var tilt_time: float = 0.2

func _physics_process(delta):
	
	#if owner.velocity.length() > threshhold:
	var input = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	if abs(input.x) > 0:
		var tween = create_tween()
		tween.tween_property(get_parent(), "rotation:z", -1 * deg_to_rad(tilt_angle) * input.x, tilt_time).set_ease(Tween.EASE_IN)
	else:
		var tween = create_tween()
		tween.tween_property(get_parent(), "rotation:z", 0, tilt_time).set_ease(Tween.EASE_IN)

