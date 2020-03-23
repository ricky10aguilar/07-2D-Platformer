extends Node2D

onready var player = $Player

func player_died():
	if player.position.y > 100:
		queue_free()

	
