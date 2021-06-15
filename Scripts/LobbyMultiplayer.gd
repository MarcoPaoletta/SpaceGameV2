extends CanvasLayer

func _on_Survive_pressed():
	get_tree().change_scene("res://Scenes/Survive2.tscn")

func _on_Infinite_pressed():
	get_tree().change_scene("res://Scenes/Infinite2.tscn")
	
func _on_1v1_pressed():
	get_tree().change_scene("res://Scenes/1V1.tscn")



