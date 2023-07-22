class_name AcidBlobEnemy extends Enemy

# Controls if a baby acid blob should be spawned upon death
@export var is_baby: bool = false
@export var spawn_count: int = 2

@onready var baby_scene: PackedScene = load("res://scenes/enemies/BabyAcidBlob.tscn")

@onready var enemy_container = get_node("/root/Containers/Enemies")
@onready var nav: NavigationAgent3D = $NavigationAgent3D
@onready var attack_box: EnemyAttacker = $AttackBox

func _ready():
	super._ready()

	attack_box.area_entered.connect(_attack_box_area_entered)

func _physics_process(delta):
	pass

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


