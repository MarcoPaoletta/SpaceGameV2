extends Node2D
onready var timer1 = $HUD/LoseMessageTimer
var explosion_scene = preload("res://Scenes/Explosion.tscn")
var asteroid_scene = preload("res://Scenes/Asteroid.tscn")
const screen_hight = 180
var game_started = false
var asteroid_instance = asteroid_scene.instance()
	
func _ready():
	Gamehandler.lifes_j1 = 3
	Gamehandler.time = 180
	Gamehandler.update_time()
	change_timer()
	fmessage()
	Gamehandler.create_lifes()
	randomize()	
		
func _on_AsteroidSpawn_timeout():
	if game_started == true:
		var asteroid_instance = asteroid_scene.instance()
		var y = rand_range(0,screen_hight)
		var x = $AsteroidPosition.position.x
		asteroid_instance.position = Vector2(x,y)
		add_child(asteroid_instance)

func change_timer():
	$AsteroidSpawn.wait_time = 0.45
	$PlayerSurvive/Timer.wait_time = 1

func fmessage():
	$HUD/FMessageLabel.show()
	$HUD/FMessageTimer.start()
	$HUD/ScoreLabel.show()
	yield($HUD/FMessageTimer,"timeout")
	$GameplayMusic.play()
	$SurviveTimer.start()
	$WinTimer.start()
	$HUD/FMessageLabel.hide()
	game_started = true
	
func lose_message():
	$PlayerSurvive/AnimationPlayer.play("crush")
	Gamehandler.deleate_lifes()
	if Gamehandler.lifes_j1 == 0:
		$GameplayMusic.stop()
		$Lifes_canvas/Lifes.hide()
		$SurviveTimer.stop()
		$HUD/LoseMessageLabel.show()
		$HUD/ScoreLabel.hide()
		$PlayerSurvive.queue_free()
		timer1.start()
		yield(timer1,"timeout")
		get_tree().change_scene("res://Scenes/Lobby.tscn")
	
func _on_Player_area_entered(area):
	if area.is_in_group("asteroid"):
		lose_message()

func _on_SurviveTimer_timeout():
	if Gamehandler.time > 0:
		Gamehandler.time -=1
		Gamehandler.update_time()
	else:
		Gamehandler.time = 0


func _on_WinTimer_timeout():
	$SurviveTimer.stop()
	$HUD/WinLabel.show()
	$PlayerSurvive.queue_free()
	timer1.start()
	yield(timer1,"timeout")
	get_tree().change_scene("res://Scenes/Lobby.tscn")

