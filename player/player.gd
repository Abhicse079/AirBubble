
extends RigidBody2D

# member variables here, example:
# var a=2
# var b="textvar"
var input_state = preload("res://Scripts/input_states.gd")
var current_speed = 100
export var speed = 50
var btn_up = input_state.new("ui_up")
var btn_right = input_state.new("ui_right")
var btn_left = input_state.new("ui_left")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here

	set_fixed_process(true)
	
func _fixed_process(delta):
	if(btn_up.check() == 1):
		set_axis_velocity(Vector2(0,-80))
		print("Up button pressed")
	if(btn_right.check() == 1):
		print("Right button pressed")
		move(speed,100,delta)
	if(btn_left.check() ==1):
		print("Left button pressed")

func move(move_speed, acceleration,delta):
	current_speed = lerp(current_speed,-move_speed,acceleration*delta)
	
	print("Move right")
	

