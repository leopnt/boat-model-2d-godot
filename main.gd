extends Node2D


func _ready():
	get_tree().paused = true

func _input(event):
	if event.is_action_pressed("ui_accept"):
		get_tree().paused = !get_tree().paused
