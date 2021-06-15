extends Area2D
class_name Player2
const move_speed = 150
const screen_width = 320
const screen_hight = 180
var can_shoot = true
var BULLETSCENE = preload("res://Scenes/Bullet2.tscn")
var explosion_scene = preload("res://Scenes/Explosion.tscn")

func _ready():
	OS.center_window()
	
func _process(_delta):
	var direction = Vector2.ZERO
	if Input.is_action_pressed("up2"):
		direction.y = -1
	if Input.is_action_pressed("down2"):
		direction.y = 1
	if Input.is_action_pressed("right2"):
		direction.x = 1
	if Input.is_action_pressed("left2"):
		direction.x = -1
	if Input.is_action_just_pressed("shoot2") and can_shoot:
		shoot()
		$Shot2.play()
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
	var bullet_instance = BULLETSCENE.instance()
	bullet_instance.position = position
	get_parent().add_child(bullet_instance)
	$Timer.start()


func _on_Timer_timeout():
	can_shoot = true
	$Timer.stop()


func _on_Player_area_entered(area):
	if area.is_in_group("asteroid"):
		var explosion_instance = explosion_scene.instance()
		explosion_instance.position = position
		get_parent().add_child(explosion_instance)
