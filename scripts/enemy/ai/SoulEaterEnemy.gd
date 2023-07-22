class_name SoulEaterEnemy extends Enemy

# Teleports behind player

# Distance away from player until when soul eat teleports
@export var seperation: float = 1

# How often teleports
@export var teleport_freq: float = 5

# How far from player should teleport to
@export var teleport_offset: float = 2

@onready var globals = get_node("/root/Globals")

var target: Player
var teleport_timer: Timer

func _ready():
	target = globals.player_ref
	
	teleport_timer = Timer.new()
	teleport_timer.timeout.connect(_teleport_timer_timeout)
	teleport_timer.autostart = true
	teleport_timer.wait_time = teleport_freq
	add_child(teleport_timer)


func _physics_process(delta):
	pass

func _teleport_timer_timeout():
	print("timeout", global_position.distance_to(target.global_position))
	if global_position.distance_to(target.global_position) > seperation:
		print("should teleport")

		# set position to just behind player facing direction

		global_position = target.global_position + (-1 * target.camera_dir()).normalized() * teleport_offset
