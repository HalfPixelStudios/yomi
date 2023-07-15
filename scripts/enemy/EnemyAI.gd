class_name EnemyAI extends Node

# Handler for enemy behavior

@export var speed: float = 10

@onready var nav: NavigationAgent3D = $"../NavigationAgent3D"

# Can be null
var target: Node

func _ready():
	# TODO replace with proper aggro system

	var player = get_node("/root").get_tree().get_nodes_in_group("player")
	if len(player) == 1:
		target = player[0]	
	else:
		print("was not able to find player")

func _physics_process(delta):

	# TODO most basic AI, attempt to move to and touch player
	#if target == null:
	#	return

	nav.target_position = target.global_position

	var facing = owner.global_position.direction_to(nav.get_next_path_position()).normalized()
	# TODO temp solution to throw away y component
	facing.y = 0

	owner.velocity = owner.velocity.move_toward(facing * speed, delta)
	nav.set_velocity(owner.velocity)
	owner.move_and_slide()

