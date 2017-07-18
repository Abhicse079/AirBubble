extends Node;


const GROUP_ENEMY = "enemy";
const GROUP_POWERUP = "powerup"
const GROUP_PLAYER = "player"
const GROUP_WEAPON = "weapon"

var score_best = 0;
var score_current = 0 setget _set_score_current

var player_hurt  = 100 setget _set_player_hurt

signal score_current_changed;
signal score_best_changed;
signal player_hit;

var currentScene = null
var copyright = "(c)2016 Abhishek"

var PlayerName = "AirBubble"

func getPlayerName():
	return PlayerName

func _ready():
	currentScene = get_tree().get_root().get_child(get_tree().get_root().get_child_count() -1 )
	Globals.set("MAX_POWER_LEVEL", 9000) #global var


func _deferred_goto_scene(path):
    # Immediately free the current scene,
    # there is no risk here.
    currentScene.free()

    # Load new scene
    var s = ResourceLoader.load(path)

    # Instance the new scene
    currentScene = s.instance()

    # Add it to the active scene, as child of root
    get_tree().get_root().add_child(currentScene)

    # optional, to make it compatible with the SceneTree.change_scene() API


func setScene(scene): #path of scene
	call_deferred("_deferred_goto_scene",scene)

func _set_best_current(new_value):
	score_best = new_value;
	emit_signal("score_best_changed");


func _set_score_current(new_value):
	score_current = score_current + new_value;
	emit_signal("score_current_changed");
	
func _set_player_hurt(new_value):
	player_hurt = player_hurt - new_value;
	emit_signal("player_hit");