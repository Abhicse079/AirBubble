extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_process(true)
	get_node("hscore").set_text(str(global.score_best))
	pass



func _on_TextureButton_pressed():
	#get_tree().change_scene("res://scn/level_selector.tscn")
	get_node("/root/global").setScene("res://main_scrn.xml")
	pass # replace with function body
