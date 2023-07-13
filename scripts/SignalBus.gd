extends Node

# player related
signal player_attack_start() # hold started
signal player_attack(hold_time: float) # hold released
signal player_switch_weapon(new_weapon: Weapon)
