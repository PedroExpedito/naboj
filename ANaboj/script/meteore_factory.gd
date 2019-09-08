extends Node2D

func _ready():
	pass 
func gerar_meteoro(val):
	return get_children()[val].duplicate() 
	pass	
func gerar_meteoro_randomico():
	return get_children()[randi() % get_children().size()].duplicate()





