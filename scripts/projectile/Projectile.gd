class_name Projectile extends RigidBody3D

@export var speed: float

signal on_hit()

# internal signal to signal that self should be destroyed
signal _destroy()

func init(facing: Vector3):
	linear_velocity = facing * speed

	_destroy.connect(__destroy)

func __destroy():
	queue_free()

