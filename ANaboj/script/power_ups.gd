extends Area2D
export var weapon = 0

func _ready():
	pass


func _on_power_up_double_body_entered(body):
	if body.is_in_group(game.GROUP_PLAYER):
		body.set_weapon(weapon)
		queue_free()
	pass # Replace with function body.


func _on_Timer_timeout():
	queue_free()
	pass 
	
