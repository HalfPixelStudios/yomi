class_name Health extends Node

signal on_change(old_value: int, new_value: int)

@export var max_health: int
var _cur_health: int

func _ready():
	_cur_health = max_health

# func _init(max_health: int):
# 	self._max_health = max_health
# 	self._cur_health = max_health

func add(health: int) -> int:
	var old_health = _cur_health
	_cur_health = clamp(_cur_health + health, 0, max_health)
	if old_health != _cur_health:
		on_change.emit(old_health, _cur_health)
	return _cur_health

func take(health: int) -> int:
	return add(-health)

func get_cur_health() -> int:
	return _cur_health

func get_max_health() -> int:
	return max_health
