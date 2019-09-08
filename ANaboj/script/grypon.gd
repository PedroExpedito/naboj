extends KinematicBody2D

var motion = Vector2()
var speed = 60000
var gun
var fire_simple = preload ("res://script/classes/weapons/fire_simple.gd")
var fire_double = preload ("res://script/classes/weapons/fire_double.gd")
var fire_ball_triple = preload("res://script/classes/weapons/fire_ball_triple.gd")
var fire = false
var move = true
#var lista para adicionar armas#
var weapons = [
fire_simple.new(self),
fire_double.new(self),
fire_ball_triple.new(self),
]

func set_weapon(val):
	gun = weapons[val]
func _ready():
	game.connect("life_changed" , self , "on_life_val")
	gun = weapons[0]
	add_to_group(game.GROUP_PLAYER)
	pass
func on_life_val():
	var audio = true
	if audio ==true:
		$audiohurt.play()	
	if game.life <= 0:
		move = false
		fire = false
		if audio == true:
			audio = false
			$audioexplose.play()
			audio = false
		$sprite.visible = false
		$animsprite.play("explose")
		yield($animsprite,"animation_finished")
		get_tree().change_scene("res://scene/main_scene/gameover.tscn")
		queue_free()
func _input(event):
	if event is InputEventScreenTouch:
		fire = true	
		pass
	if event is InputEventScreenDrag:
		self.global_position = event.position
			
func _physics_process(delta):
		
	
	
	#Sistema de tiro button#
	if not Input.is_action_pressed("key_space"):
		if fire == true:
			gun.fire()
	else:
		gun.fire()		
		pass
	gun.update()
	#sistema de tiro button#
	
	#MOVIMENTAÇÃO#
	if move == true:
		if Input.is_action_pressed("key_d") and position.x <= 646:
			motion.x = speed * delta
			$anim.play("rotaterigt")
		elif Input.is_action_pressed("key_a") and position.x >= 70:
			motion.x = -speed * delta
			$anim.play("rotateleft")
		else:
			$anim.play("idle")
			motion.x = 0	
		if Input.is_action_pressed("key_w") and position.y >= 80:
			motion.y = -speed * delta
		elif Input.is_action_pressed("key_s") and position.y <= 1200:
			motion.y = speed * delta			
		else:
			motion.y = 0			
		motion = move_and_slide(motion)		
    # MOVIMENTAÇÃO ACIMA #

func _on_aura_area_entered(area):
	if area.is_in_group(game.GROUP_ENEMY):
		if area.has_method("damage"):
			area.damage(999)
			game.life -= 1
	pass # Replace with function body.
