class_name ItemPickup extends Area3D

# Handles picking up items

func _ready():
    area_entered.connect(_area_entered)

func _area_entered(area):
    if area is DroppedItem:
        pass
