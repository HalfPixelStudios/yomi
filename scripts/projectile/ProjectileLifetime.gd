extends Node

# Keeps track of projectile's lifetime

@export var pierce: int = 1

var cur_pierce: int

func _ready():

	cur_pierce = pierce

	owner.on_hit.connect(_on_hit)

func _on_hit():
	cur_pierce -= 1
	if cur_pierce <= 0:
		owner._destroy.emit()

