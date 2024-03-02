extends Node2D

var valor_moneda = 1

@onready var coinSound = $Sprite2D/Area2D/coinSound

func _on_area_2d_body_entered(body):
	if body.has_method("recollect_coins") and body.name == "CharacterBody2D":
		body.recollect_coins(valor_moneda)
		queue_free()

