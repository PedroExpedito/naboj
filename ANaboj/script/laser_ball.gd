extends Node2D
export var side_select = 0
var speed = 9000
func _ready():
	
	pass 
func _process(delta):
	if side_select == 0:
		diagonal_right(delta)
	elif side_select == 1:
		diagonal_left(delta)
	elif side_select == 2:
		top(delta)	
		
	pass
func diagonal_right(delta):
	position.y -= speed * delta
	position.x += speed / 3.5 * delta	
func diagonal_left(delta):
	position.y -= speed * delta
	position.x -= speed / 3.5 * delta
func top(delta):
	position.y -= speed * delta
		

func _on_laser_ball_area_entered(area):
	if area.is_in_group(game.GROUP_ENEMY):
		if area.has_method("damage"):
			area.damage(1)
			queue_free()
	pass # Replace with function body.
