
extends Node2D

var d_plane = preload("res://player/enemy.xml")
var ene_plane = preload("res://player/master.tscn")
var coins = preload("res://assets/coins/coins.tscn")

var health = 100

var planeCounter = 0
var flag = 0;
var crash_counter = 0

func ePlane():
	var eplane_instance = d_plane.instance()
	eplane_instance.set_pos(Vector2(get_node("player_2").get_pos().x+600,rand_range(50,(get_viewport_rect().size.x-200))))
	add_child(eplane_instance)
	
func coins():
	var coin_instance = coins.instance()
	coin_instance.set_pos(Vector2(get_node("player_2").get_pos().x+400,20))
	add_child(coin_instance)

	print("Coin Added")
func _ready():
	set_fixed_process(true)
	get_node("hud/ui/life").get_pos()
	get_node("SamplePlayer").play("background",false)
	
func _fixed_process(delta):
	get_node("hud/ui/score_board/score").set_text(str(global.score_current))
	health = global.player_hurt
	get_node("hud/ui/ProgressBar").set_value(health)
	print(global.player_hurt)
	health += delta *2 
	if(global.score_current >global.score_best):
		global._set_best_current(global.score_current)
	get_node("hud/ui/h_score").set_text(str(global.score_best))
	if(flag > 5):
		ePlane()
		flag = 0
	flag = flag + delta

func _on_TextureButton_pressed():
	print("button pressed")
	get_tree().set_pause(true)
	get_node("hud/pause_popup").show()
	pass # replace with function body


func _on_TextureButton_button_up():

	print("button up")
	pass # replace with function body


func _on_TextureButton_button_down():
	get_tree().reload_current_scene()
	print("button down")
	pass # replace with function body

func _on_Button_pressed():
	get_node("hud/pause_popup").hide()
	get_tree().set_pause(false)
	pass # replace with function body
