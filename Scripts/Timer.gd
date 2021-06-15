extends Node2D

func _ready():
	Gamehandler.timer = 0
	Gamehandler.update_timer()

func _on_Timer_timeout():
	Gamehandler.timer += 1
	Gamehandler.update_timer()
