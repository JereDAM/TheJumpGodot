extends Node

var player: Player
var score = 0

func respawnPlayer():
	player.global_position.x = 98
	player.global_position.y = 393
