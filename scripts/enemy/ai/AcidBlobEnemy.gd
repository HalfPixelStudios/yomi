class_name AcidBlobEnemy extends Enemy

# Controls if a baby acid blob should be spawned upon death
@export var is_baby: bool = false
# How many babies are spawned upon death
@export var spawn_count: int = 2
# Time between jumps
@export var jump_freq: float = 2
# Height of the jump
@export var jump_height: float = 2
# How long is spent jumping
@export var airborn_time: float = 2
# Horizontal speed when jumping
@export var speed: float = 10

@onready var baby_scene: PackedScene = load("res://scenes/enemies/BabyAcidBlob.tscn")

@onready var enemy_container = get_node("/root/Containers/Enemies")
@onready var globals = get_node("/root/Globals")

@onready var nav: NavigationAgent3D = $NavigationAgent3D
@onready var attack_box: EnemyAttacker = $AttackBox

var target: Node3D

var jump_timer: Timer
var airborn_timer: Timer
var is_jumping: bool = false

var tween

func _ready():
	super._ready()

	target = globals.player_ref

	attack_box.area_entered.connect(_attack_box_area_entered)

	# Create timers
	jump_timer = Timer.new()
	jump_timer.timeout.connect(_jump_timer_timeout)
	jump_timer.one_shot = true
	jump_timer.autostart = true
	jump_timer.wait_time = jump_freq
	add_child(jump_timer)

	airborn_timer = Timer.new()
	airborn_timer.timeout.connect(_airborn_timer_timeout)
	airborn_timer.one_shot = true
	airborn_timer.autostart = true
	airborn_timer.wait_time = airborn_time
	add_child(airborn_timer)

func _physics_process(delta):
	if is_jumping:
		nav.target_position = target.global_position

		var facing = global_position.direction_to(nav.get_next_path_position()).normalized()
		# TODO temp solution to throw away y component
		facing.y = 0

		velocity = velocity.move_toward(facing * speed, delta)
		nav.set_velocity(velocity)
		move_and_slide()

func _jump_timer_timeout():
	is_jumping = true
	print("jump")
	airborn_timer.start()

	# tween y position
	tween = create_tween()
	tween.tween_property(self, "position:y", jump_height, airborn_time/2).as_relative().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(self, "position:y", -1 * jump_height, airborn_time/2).as_relative().set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_CUBIC)

func _airborn_timer_timeout():
	is_jumping = false
	print("on ground")
	jump_timer.start()

func _attack_box_area_entered(area):
	if area is PlayerHitBox:
		attack_box.attack.emit()

# OVERRIDE
func handle_death():

	# Spawn baby blobs
	if not is_baby:
		for i in range(spawn_count):
			var inst = baby_scene.instantiate()
			inst.global_position = global_position
			enemy_container.add_child(inst)


