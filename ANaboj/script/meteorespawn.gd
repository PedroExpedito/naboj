extends Node2D

var pre_meteoro = preload ("res://scene/meteoros/meteore_factory.tscn")
var meteoro2
func _ready():
	meteoro2 = pre_meteoro.instance()
	pass 
func _on_timer_timeout():
	$timer.set_wait_time(rand_range(1 , 2))
	var meteoro = meteoro2.gerar_meteoro_randomico()
	meteoro.position.y = -100
	meteoro.position.x =(rand_range(30 , 610))
	$"../".add_child(meteoro)
	pass # Replace with function body.
