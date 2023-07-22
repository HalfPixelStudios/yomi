class_name Player extends CharacterBody3D

@export var movement_speed: float = 5.0
@export var look_sensitivity: float = 0.01

@onready var health: Health = $Health
@onready var camera_pivot = $CameraPivot
@onready var camera = $CameraPivot/Camera

@onready var signal_bus = get_node("/root/SignalBus")

# TODO move this to shared constants file
const gravity: float = 8.0

signal on_hit()

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	on_hit.connect(_on_hit)
	health.on_death.connect(_on_death)
	#add_to_group("player")

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		camera_pivot.rotate_y(-event.relative.x * look_sensitivity)

func _physics_process(delta):

	var input = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	var move_dir = (camera_pivot.transform.basis * Vector3(input.x, 0, input.y)).normalized()
	if move_dir:
		velocity.x = move_dir.x * movement_speed
		velocity.z = move_dir.z * movement_speed
	else:
		velocity.x = 0.0
		velocity.z = 0.0

	move_and_slide()

func _on_hit():
	print("player was hit!")
	health.take(50)

func camera_dir() -> Vector3:
	# forward vector of camera
	return camera_pivot.transform.basis * Vector3(0, 0, -1)


func _on_death():
	print("PLAYER DIED!")
