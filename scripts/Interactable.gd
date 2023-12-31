class_name Interactable extends Area3D

@export var dialogue_file: String

@onready var indicator: Sprite3D = $Indicator

signal on_interact()

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

# Call this function to initiate interaction
func interact():
	on_interact.emit()

	# TODO Hardcoded to handle dialogue interactions for now
	DialogueManager.show_example_dialogue_balloon(load(dialogue_file), "start")

