extends Area2D

var health = 10
var pre_fire = preload ("res://scene/enemys/fire_enemy/enemy_fire.tscn")

func _ready():
	$animsprite.play("idle")
	add_to_group(game.GROUP_ENEMY)
	$sprite.set_texture(resources.random_texture())
	pass 


func damage(val):
	health -= val
	if health <=0:
		$audioexplose.play()
		$sprite.visible = false
		remove_from_group(game.GROUP_ENEMY)
		die()	
func die():
	game.score += 100
	$animsprite.play("explose")
	yield($animsprite,"animation_finished")
	queue_free()
func _on_Timer_timeout():
		var fire = pre_fire.instance()
		fire.global_position = fire.global_position + $position.global_position
		get_owner().add_child(fire)
		pass # Replace with function body.
