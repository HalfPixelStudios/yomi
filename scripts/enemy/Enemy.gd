extends Node3D

# Used to tie all components together in enemy
# Can be thought of an enemy scene local bus

@onready var health: Health = $Health

# Used internally to scene
signal on_hit()

func _ready():
	on_hit.connect(_on_hit)

func _on_hit():
	health.take(10)
