extends Node
const GROUP_ENEMY = "enemy"
const GROUP_PLAYER = "player"
const GROUP_FIRE = "fire"
var score = 0 setget setscore 
var life = 3 setget setlife

signal score_changed
signal life_changed

func _ready():
	randomize()
	pass 
func setscore(val):
	if val >0:
		score = val
		emit_signal("score_changed")
	pass
func setlife(val):
	life = val
	emit_signal("life_changed")
	