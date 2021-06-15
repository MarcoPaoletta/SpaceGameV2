extends Node2D
onready var timer1 = $HUD/LoseMessageTimer
var explosion_scene = preload("res://Scenes/Explosion.tscn")
var asteroid_scene = preload("res://Scenes/Asteroid.tscn")
const screen_hight = 180
var game_started = false
var asteroid_instance = asteroid_scene.instance()

func _ready():
	change_timer()
	fmessage()
	randomize()
	
func _on_AsteroidSpawn_timeout():
	if game_started == true:
		var asteroid_instance = asteroid_scene.instance()
		var y = rand_range(0,screen_hight)
		var x = $AsteroidPosition.position.x
		asteroid_instance.position = Vector2(x,y)
		add_child(asteroid_instance)

func change_timer():
	$AsteroidSpawn.wait_time = 0.8

func fmessage():
	$HUD/FMessageLabel.show()
	$HUD/FMessageTimer.start()
	yield($HUD/FMessageTimer,"timeout")
	$Timer/Timer.start()
	$HUD/FMessageLabel.hide()
	game_started = true
	
func lose_message():
	$Asteroid.queue_free()
	$Timer/Timer.stop()
	$HUD/ScoreLabel.hide()
	$Player.queue_free()
	$Player2.queue_free()
	$Asteroid.queue_free()
	timer1.start()
	yield(timer1,"timeout")
	get_tree().change_scene("res://Scenes/Lobby.tscn")
	
func _on_Player_area_entered(area):
	if area.is_in_group("asteroid"):
		if Player:
			$HUD/Player2Label.show()
			lose_message()

func _on_Player2_area_entered(area):
	if area.is_in_group("asteroid"):
		if Player2:
			$HUD/Player1Label.show()
			lose_message()
