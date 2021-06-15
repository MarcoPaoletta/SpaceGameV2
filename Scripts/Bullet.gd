extends Area2D
const move_speed = 200
const screen_widt = 320

func _process(_delta):
	position += Vector2(move_speed * _delta, 0)
	if position.x > screen_widt + 10: 
		queue_free()


func _on_Bullet_area_entered(area):
	if area.is_in_group("asteroid"):
		queue_free()
