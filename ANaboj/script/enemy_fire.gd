extends Area2D
var speed = 1000

func _ready():
	$audioshoot.play()
	pass 

func _process(delta):
	position.y += speed * delta
	pass


func _on_enemy_fire_body_entered(body):
	if body.is_in_group(game.GROUP_PLAYER):
		game.life -= 1
	pass # Replace with function body.
