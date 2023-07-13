class_name Projectile extends RigidBody3D

@export var speed: float

func init(facing: Vector3):
	linear_velocity = facing * speed

