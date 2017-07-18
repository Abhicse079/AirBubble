
extends KinematicBody2D

var enemyPos = Vector2()
var strength = 10
var score = 0
var hit = false
var speed  = -2
var timer 
var delay = .1
var destroy_enemy = true

func _ready():
	print("enemy fired")
	add_to_group(global.GROUP_ENEMY)
	set_process(true)
	timer = get_node("Timer")
	timer.set_one_shot(true)
	timer.set_wait_time(delay)

	
func on_time_complete():
	destroy_enemy = true
func _process(delta):
	if get_pos().x <get_tree().get_root().get_node("world").get_children()[1].get_pos().x-100 :
		queue_free()
		print("Object freed")
	move(Vector2(1,0)*speed)
	#move_to(get_node("../player_2").get_pos())

func _on_Area2D_body_enter( body ):
	
	if body.is_in_group(global.GROUP_PLAYER):
		print("Colliding with Player")
		global._set_player_hurt(10)
		queue_free()
	if body.is_in_group(global.GROUP_WEAPON):
		strength -= 5
		
		get_node("SamplePlayer").play("hurt",true)	
		if(strength == 0):
			get_node("AnimationPlayer").play("blast")
			global._set_score_current(1)
			timer.connect("timeout",self,"on_time_complete")
		body.queue_free()
	pass 
