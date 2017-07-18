
extends KinematicBody2D

var input_state = preload("res://Scripts/input_states.gd")
var weapons = preload("res://player/weapons.tscn")

var current_speed = 100
var current_score = 0
export var speed = 0
var btn_up = input_state.new("ui_up")
var btn_right = input_state.new("ui_right")
var btn_left = input_state.new("ui_left")
var btn_down = input_state.new("ui_down")
var fire = input_state.new("fire")
var timer
var shot_delay = .4
var can_shot = true

func _ready():
	add_to_group(global.GROUP_PLAYER)
	set_fixed_process(true)
	timer = get_node("Timer")
	timer.set_one_shot(true)
	timer.set_wait_time(shot_delay)
	timer.connect("timeout",self,"on_time_complete")
	
func speed_control(delta):
	current_speed += 10*delta

func on_time_complete():
	can_shot = true
	

#func _process(delta):
  #  set_rot( get_pos().angle_to_point( get_viewport().get_mouse_pos() ) + deg2rad(180) )
    
func _fixed_process(delta):
	current_score = global.score_current
	if(btn_up.check()):
		if(get_pos().y > 20):
			move(Vector2(0,-1) * current_speed * delta)
	
	if(btn_right.check()):
		current_speed = 300
		 
	if(btn_left.check()):
		if(get_pos().x >0):
			move(Vector2(-2,0) * current_speed * delta)

	if(btn_down.check()):
		if(get_pos().y < 600):
			move(Vector2(0,1) * current_speed * delta)
	if(fire.check() == 1 && can_shot ):
		fire()
		can_shot = false 
		timer.start()
	move(Vector2(1,0) * current_speed * delta)
	current_speed = 200 

	
func fire():
	get_node("SamplePlayer").play("shot")
	var weapon_instacne = weapons.instance()
	var distance_from_me = 200 
	var direction = get_node("Position2D").get_pos()
	var spawn_point      = self.get_global_pos() + direction
	get_tree().get_root().get_node("world").add_child(weapon_instacne)
	weapon_instacne.set_global_pos(spawn_point)
	print("fire")

	
func _on_fire_pressed():
	if( can_shot ):
		fire()
		can_shot = false
		timer.start()
	pass # replace with function body
