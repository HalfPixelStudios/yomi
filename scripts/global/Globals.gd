extends Node

# Globally accessable references to singletons and other data

var player_ref: Player

func _ready():

	var player = get_node("/root").get_tree().get_nodes_in_group("player")
	if len(player) == 1:
		player_ref = player[0]	
	else:
		print("was not able to find player")
