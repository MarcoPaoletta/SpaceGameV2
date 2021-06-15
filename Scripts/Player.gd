extends Area2D
const move_speed = 150
const screen_width = 320
const screen_hight = 180
var can_shoot = true
var BULLETSCENE = preload("res://Scenes/Bullet.tscn")

func _ready():
	OS.center_window()
	
func _process(_delta):
	var direction = Vector2.ZERO
	if Input.is_action_pressed("up"):
		direction.y = -1
	if Input.is_action_pressed("down"):
		direction.y = 1
	if Input.is_action_pressed("right"):
		direction.x = 1
	if Input.is_action_pressed("left"):
		direction.x = -1
	if Input.is_action_just_pressed("shoot") and can_shoot:
		shoot()
	if Input.is_action_pressed("lobby"):
		get_tree().change_scene("res://Scenes/Lobby.tscn")
	if Input.is_action_pressed("quit"):
		get_tree().quit()
			
	if direction.length() > 0:
		direction = direction.normalized()
		
	position.x = clamp(position.x,0,screen_width)
	position.y = clamp(position.y,0,screen_hight)
	position   += move_speed * direction * _delta
	
func shoot():
	can_shoot = false
	$Shot1.play()
	var bullet_instance = BULLETSCENE.instance()
	bullet_instance.position = position
	get_parent().add_child(bullet_instance)
	$Timer.start()


func _on_Timer_timeout():
	can_shoot = true
	$Timer.stop()
	

		

		
	
