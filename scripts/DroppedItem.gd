class_name DroppedItem extends Node3D

# Management script for dropped item node (in the world)

var _item: Item

@onready var sprite: Sprite3D = $Sprite3D

# TODO add option for if item is auto-pickup or requires user to manually pickup

func _init(item: Item):
	_item = item
	sprite.texture = item.image_texture

