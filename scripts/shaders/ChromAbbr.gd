class_name ChromAbbr extends CanvasItem

@export var intensity: float = 0.03
@export var freq: float = 1000
@export var y_offset: float = PI/2

func _ready():
	pass

func _physics_process(delta):
	var time = Time.get_ticks_msec()
	material.set_shader_parameter("x_shift", sin(time * 1/freq) * intensity)
	material.set_shader_parameter("y_shift", sin((time+y_offset) * 1/freq) * intensity)	
