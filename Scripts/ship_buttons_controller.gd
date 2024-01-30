extends Node2D

@export var character : CharacterBody2D

func _on_button_pressed(extra_arg_0):
	character.moveit()
