extends Area2D
var speed = 2000

func _ready():
	$audioshoot.play()
	pass 
func _process(delta):
	position.y += -speed * delta
	if position.y <= 0:
		queue_free()
	pass


func _on_laser1_area_entered(area):
	if area.is_in_group(game.GROUP_ENEMY):
		if area.has_method("damage"):
			area.damage(1)
		else:
			area.queue_free()	
		queue_free()
	pass # Replace with function body.
