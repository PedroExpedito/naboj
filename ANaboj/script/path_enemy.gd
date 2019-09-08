extends Path2D
onready var fallow = $path_fallow
var speed = 200
func _ready():
	set_process(true)
	set_curve(resources.random_path())
	pass 

func _process(delta):
	fallow.set_offset(fallow.get_offset() + speed * delta)
	if fallow.get_unit_offset() >=1:
		queue_free()