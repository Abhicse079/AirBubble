extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var lock_stage = preload("res://images/level_editors/0.png")
var stage_1 = preload("res://images/level_editors/1.png")
var stage_2 = preload("res://images/level_editors/2.png")
var stage_3 = preload("res://images/level_editors/3.png")
var stage_4 = preload("res://images/level_editors/4.png")
var stage_5 = preload("res://images/level_editors/5.png")
var stage_6 = preload("res://images/level_editors/6.png")
var stage_7 = preload("res://images/level_editors/7.png")
var stage_8 = preload("res://images/level_editors/8.png")
var stage_9 = preload("res://images/level_editors/9.png")
var stage_10 = preload("res://images/level_editors/10.png")
var stage_11 = preload("res://images/level_editors/11.png")
var stage_12 = preload("res://images/level_editors/12.png")
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	if get_node("/root/global").score_current == 2:
		get_node("Sprite/Sprite/stage_2").set_normal_texture(stage_2)
	if get_node("/root/global").score_current == 20:
		get_node("Sprite/Sprite/stage_3").set_normal_texture(stage_3)
	if get_node("/root/global").score_current == 30:
		get_node("Sprite/Sprite/stage_4").set_normal_texture(stage_4)
	if get_node("/root/global").score_current == 40:
		get_node("Sprite/Sprite/stage_5").set_normal_texture(stage_5)	
	if get_node("/root/global").score_current == 50:
		get_node("Sprite/Sprite/stage_6").set_normal_texture(stage_6)
	if get_node("/root/global").score_current == 60:
		get_node("Sprite/Sprite/stage_7").set_normal_texture(stage_7)
	if get_node("/root/global").score_current == 70:
		get_node("Sprite/Sprite/stage_8").set_normal_texture(stage_8)
	if get_node("/root/global").score_current == 80:
		get_node("Sprite/Sprite/stage_9").set_normal_texture(stage_9)
	if get_node("/root/global").score_current == 90:
		get_node("Sprite/Sprite/stage_10").set_normal_texture(stage_10)	
	if get_node("/root/global").score_current == 100:
		get_node("Sprite/Sprite/stage_11").set_normal_texture(stage_11)
	if get_node("/root/global").score_current == 110:
		get_node("Sprite/Sprite/stage_12").set_normal_texture(stage_12)
	pass


func _on_stage_1_pressed():
	get_node("/root/global").setScene("res://main_scrn.xml")
	pass # replace with function body


func _on_stage_2_pressed():
	get_node("Sprite/Sprite/stage_2").set_normal_texture(stage_2)
	pass # replace with function body
