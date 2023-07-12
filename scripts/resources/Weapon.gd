class_name Weapon extends Resource

enum WeaponType { MELEE, RANGED }

@export var name: String
# @export var flavor_text: String
@export var inventory_sprite: Texture2D

@export var weapon_type: WeaponType
@export var hit_box: Area3D

