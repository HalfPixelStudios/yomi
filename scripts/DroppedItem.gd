class_name DroppedItem extends Node3D

# Management script for dropped item node (in the world)

# Called when item should remove itself
signal remove_item()

var _item: Item

@onready var sprite: Sprite3D = $Sprite3D

# TODO add option for if item is auto-pickup or requires user to manually pickup

func _ready():
	remove_item.connect(_remove_item)

func setup(item: Item):
	_item = item
	sprite.texture = item.image_texture


func _remove_item():
	queue_free()
