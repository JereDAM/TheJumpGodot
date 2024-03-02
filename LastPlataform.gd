extends Node2D

@onready var ultimaPlataforma = $Area2D/GoodLuck

func _on_area_2d_body_entered(body):
	if body.name == "CharacterBody2D":
		ultimaPlataforma.play()
