extends Control

@export var planet : MeshInstance3D

func _on_button_pressed() -> void:
	planet.randomizeNoise()
