#Class fire_double
var pre_fire = preload ("res://scene/laser/laser_ball.tscn")
var fire_time = 1
var nave
var fire_rate = 0.1
func _init(nave):
	self.nave = nave
	
func fire():
	if fire_time >=1:
		create_fire(nave.find_node("positiontop"))
		fire_time = fire_rate
	
func create_fire(node):
	var fire = pre_fire.instance()
	fire.global_position = node.global_position
	nave.get_owner().add_child(fire)
	fire_time = fire_rate
func update():
	if fire_time <= 1:
		fire_time += fire_rate