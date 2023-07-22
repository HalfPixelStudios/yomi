class_name Enemy extends CharacterBody3D

# Used to tie all components together in enemy
# Can be thought of an enemy scene local bus

# Required components
@onready var health: Health = $Health
@onready var drop_table: DropTable = $DropTable

@onready var dropped_item_scene: PackedScene = preload("res://scenes/DroppedItem.tscn")
@onready var dropped_item_container = get_node("/root/Containers/DroppedItems")

# Used internally to scene
signal on_hit()

func _ready():
	on_hit.connect(_on_hit)
	health.on_death.connect(_on_death)
	add_to_group("enemy")

func _on_hit():

	handle_hit()

	health.take(100)

func _on_death():

	handle_death()

	_spawn_drops()

	queue_free()

func _spawn_drops():
	var drops = drop_table.get_drops()

	# Spawn drops
	for drop in drops:
		var inst = dropped_item_scene.instantiate()
		inst.global_transform = global_transform

		dropped_item_container.add_child(inst)
		inst.setup(drop)

# Virtual Methods

func handle_hit():
	pass

func handle_death():
	pass

