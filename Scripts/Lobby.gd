extends CanvasLayer

func _on_Multiplayer_pressed():
	get_tree().change_scene("res://Scenes/LobbyMultiplayer.tscn")
	
func _on_Solo_pressed():
	get_tree().change_scene("res://Scenes/CharacterSelector.tscn")

func _on_1v1_pressed():
	get_tree().change_scene("res://Scenes/1V1.tscn")

func _on_Help_pressed():
	get_tree().change_scene("res://Scenes/Help.tscn")

func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/Lobby.tscn")


