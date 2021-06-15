extends Sprite
var reload = false
var maximize = false
const screen_width = 320 
const move_speed = -80

func _ready():
	OS.center_window()
	
func _process(_delta):
	position += Vector2(move_speed * _delta, 0)
	if position.x <= -screen_width:
		position.x += screen_width
	if Input.is_action_pressed("quit"):
		get_tree().quit()
	if Input.is_action_just_pressed("lobby"):
		get_tree().change_scene("res://Scenes/Lobby.tscn")
	if Input.is_action_pressed("fullscreen"):
		if maximize == true:
			$MaximizeTimer.start()
			maximize = false
			OS.window_fullscreen = !OS.window_fullscreen
	if Input.is_action_pressed("reload"):
			if reload == true:
				$ReloadTimer.start()
				reload = false
				get_tree().reload_current_scene()

func _on_ReloadTimer_timeout():
	reload = true

func _on_MaximizeTimer_timeout():
	maximize = true
