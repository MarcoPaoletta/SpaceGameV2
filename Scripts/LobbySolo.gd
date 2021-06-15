extends CanvasLayer



func _on_Survive_pressed():
	get_tree().change_scene("res://Scenes/Survive.tscn")

func _on_Infinite_pressed():
	get_tree().change_scene("res://Scenes/Infinite1.tscn")
	
func _on_Lifes_pressed():
	get_tree().change_scene("res://Scenes/Lifes.tscn")	



