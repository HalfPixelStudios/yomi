extends Node

@export var weapons: Array[Weapon]

@onready var signal_bus = get_node("/root/SignalBus")

# Index into weapon array
@export var selected_weapon: int

func get_current_weapon():
	return weapons[selected_weapon]

func switch_weapon(index):
	if index < 0 or index >= len(weapons):
		# TODO print error here
		return

	selected_weapon = index
	print("switching to weapon ", index)
	signal_bus.player_switch_weapon.emit(get_current_weapon())

# TODO maybe move weapon switching somewhere else
func _physics_process(delta):
	if Input.is_action_just_pressed("hotbar_1"):
		switch_weapon(0)
	elif Input.is_action_just_pressed("hotbar_2"):
		switch_weapon(1)

