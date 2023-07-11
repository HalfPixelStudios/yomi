extends Node3D

@export var bob_frequency: float = 3.0
@export var bob_amplitude: float = 0.05

var t_bob: float = 0.0

func _physics_process(delta):
	t_bob += delta * owner.velocity.length()
	get_parent().transform.origin = _headbob(t_bob)

func _headbob(time) -> Vector3:
	var pos = Vector3.ZERO
	pos.y = sin(time * bob_frequency) * bob_amplitude
	return pos


