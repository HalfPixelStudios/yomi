class_name EnemyAI extends Node

# Handler for enemy behavior

@export var speed: float = 10

@onready var nav: NavigationAgent3D = $"../NavigationAgent3D"
@onready var attack_box: EnemyAttacker = $"../AttackBox"
@onready var globals = get_node("/root/Globals")

# Can be null
var target: Node3D

func _ready():
	# TODO replace with proper aggro system
	target = globals.player_ref

	# current ai: attack player when in range
	attack_box.area_entered.connect(_attack_box_area_entered)

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

func _attack_box_area_entered(area):
	if area is PlayerHitBox:
		attack_box.attack.emit()
