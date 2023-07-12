extends Node3D

# Flash sprite when taking damage

@export var flash_speed: float = 0.2
@export var flash_color: Color = Color.RED

func _ready():
	assert(get_parent() is Sprite3D)
	owner._hit.connect(flash)

func flash():
	var tween = create_tween()
	var original_color = get_parent().modulate
	tween.tween_property(get_parent(), "modulate", flash_color, flash_speed)
	tween.tween_property(get_parent(), "modulate", original_color, flash_speed)

