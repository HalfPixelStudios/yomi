extends Node3D

@export var health_ref: Health

@onready var progress_bar = $Viewport/ProgressBar

func _ready():
	health_ref.on_change.connect(_health_bar_on_change)
	progress_bar.max_value = health_ref.get_max_health()
	progress_bar.value = health_ref.get_cur_health()

func _health_bar_on_change(old_value: int, new_value: int):
	progress_bar.value = health_ref.get_cur_health()

