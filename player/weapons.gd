extends KinematicBody2D

var speed = 10

func _ready():
	add_to_group(global.GROUP_WEAPON)
	set_process(true)
	pass

func _process(delta):                                        
	move(Vector2(1,0)*speed)
	if get_pos().x > get_node("../player_2").get_pos().x+1000:
		queue_free()

