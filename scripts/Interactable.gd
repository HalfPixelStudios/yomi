class_name Interactable extends Area3D

@onready var indicator: Sprite3D = $Indicator

func _ready():
	##area_entered.connect(_area_entered)
	pass

func _physics_process(delta):

	# TODO code is extra verbose for clarity, could technically simplify it
	var overlapping = false
	for area in get_overlapping_areas():
		if area is Interactor:
			overlapping = true
			break

	if overlapping:
		indicator.visible = true
	else:
		indicator.visible = false
