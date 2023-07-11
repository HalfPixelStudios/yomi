extends Control

@onready var anim = $Animation

@onready var signal_bus = get_node("/root/SignalBus")

func _ready():
	signal_bus.player_attack.connect(_player_attack)

func _player_attack():
	print("playing attack anim")
	anim.play("Attack")
