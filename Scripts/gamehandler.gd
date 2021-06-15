extends Node
var time = 180
var timer = 0
var score = 0
var offset_lifes = 12
#export (PackedScene) var lifes
var lifes = preload("res://Scenes/Spr_lifes.tscn")
var lifes_j1 = 3
var lifes_group = []

func create_lifes():
	for i in lifes_j1:
		var new_vida = lifes.instance()
		get_tree().get_nodes_in_group("lifeshud")[0].add_child(new_vida)
		new_vida.global_position.y += offset_lifes * i
		lifes_group.append(new_vida)
		
func deleate_lifes():
	lifes_j1 -= 1
	lifes_group[lifes_j1].queue_free()

func update_score():
	get_tree().get_nodes_in_group("points")[0].text = String(score)

func update_time():
	get_tree().get_nodes_in_group("timer")[0].text = String(time/60) + ":" + String(time%60)
	
func update_timer():
	get_tree().get_nodes_in_group("time")[0].text = String(timer/60) + ":" + String(timer%60)

