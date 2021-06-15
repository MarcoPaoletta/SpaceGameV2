extends Area2D
const move_speed = 100
var explosion_scene = preload("res://Scenes/Explosion.tscn")
onready var timer1 = $HUD/LoseMessageTimer
	
func _ready():
	Gamehandler.update_score()
	
func _physics_process(_delta):
	position -= Vector2(move_speed * _delta, 0)
	if position.x < -100:
		queue_free()
		
	
func _on_Asteroid_area_entered(area):
	if area.is_in_group("bullet"):
		var explosion_instance = explosion_scene.instance()
		explosion_instance.position = position
		get_parent().add_child(explosion_instance)
		queue_free()
		Gamehandler.score += 1
		Gamehandler.update_score()
