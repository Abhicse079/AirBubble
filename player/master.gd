
extends RigidBody2D

# member variables here, example:
# var a=2
# var b="textvar"
var weaponPos = Vector2()
var weaponDamage = 1

func _ready():
	get_node("Sprite").hide()
	set_process(true)
	pass

func _process(delta):
	weaponPos.y = weaponPos.y - 500 * delta
	set_pos(weaponPos)

	if get_pos().y < 0:
		queue_free()
	pass
