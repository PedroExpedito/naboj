extends Area2D
export var speed = 0
export var rotate = 0
export var health = 4
var drop_prabability 
var pre_power_up_triple = preload ("res://scene/powerups/power_up_triple.tscn")
var pre_power_up_double = preload ("res://scene/powerups/power_up_double.tscn")
func _ready():
	add_to_group(game.GROUP_ENEMY)
	randomize()
	rotate = rand_range(-10 ,10)
	speed = rand_range(150 , 250)
	drop_prabability = rand_range(1 , 11)
	set_process(true)
	pass
func _process(delta):
	rotate(rotate * delta)
	position.y += speed * delta
func damage(val):
	$anim.play("hit")
	health -= val
	if health <=0:
		$audioexplose.play()
		var power_up_triple = pre_power_up_triple.instance()
		var power_up_double = pre_power_up_double.instance()
		power_up_triple.global_position = self.position
		power_up_double.global_position = self.position
		if drop_prabability >10:
			$"../".add_child(power_up_triple)
		if drop_prabability < 2:
			$"../".add_child(power_up_double)	
		game.score += 10
		remove_from_group(game.GROUP_ENEMY)	
	pass
			 
func _on_meteoro_body_entered(body):
	if body.is_in_group(game.GROUP_PLAYER):
		$"/root/main".find_node("cameraparallax").shake()


func _on_Timer_timeout():
	queue_free()
	pass 
func _on_meteoro_area_entered(area):
	if area.is_in_group(game.GROUP_PLAYER):
		$"/root/main".find_node("cameraparallax").shake()
	pass # Replace with function body.





func _on_audioexplose_finished():
	queue_free()
	pass # Replace with function body.
