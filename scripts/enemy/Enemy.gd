class_name Enemy extends CharacterBody3D

# Used to tie all components together in enemy
# Can be thought of an enemy scene local bus

@onready var health: Health = $Health

# Used internally to scene
signal on_hit()

func _ready():
	on_hit.connect(_on_hit)
	health.on_death.connect(_on_death)
	add_to_group("enemy")

func _on_hit():
	health.take(10)

func _on_death():
	queue_free()
