class_name Health extends Node

@export var max_health: int
var _cur_health: int

func _ready():
	_cur_health = max_health

# func _init(max_health: int):
# 	self._max_health = max_health
# 	self._cur_health = max_health

func add(health: int) -> int:
	_cur_health = clamp(_cur_health + health, 0, max_health)
	return _cur_health

func take(health: int) -> int:
	_cur_health = clamp(_cur_health - health, 0, max_health)
	return _cur_health
