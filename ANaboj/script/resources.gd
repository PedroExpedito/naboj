extends Node

var paths = []
var enemy_texture = []

const path_dir = "res://paths/"
const enemy_texture_dir = "res://texture/gamepack/enemys/"

func _ready():
	load_paths()
	texture_load()
	pass
func random_path():
    return paths[randi() % paths.size()]
func random_texture():
	return enemy_texture[randi() % enemy_texture.size()]
func load_paths():
    var dir = Directory.new()
    dir.change_dir(path_dir)
    dir.list_dir_begin()

    var path_file = dir.get_next()
    var path
    while path_file != "":
        if dir.current_is_dir():
            pass
        else:
            #print("loading: " + path_dir + path_file)
            path = load(path_dir + path_file)
            if path && path is Curve2D: #error occours here
                paths.append(path)

        path_file = dir.get_next()
func texture_load():
    var dir = Directory.new()
    dir.change_dir(enemy_texture_dir)
    dir.list_dir_begin()

    var texture_file = dir.get_next()
    var texture
    while texture_file != "":
        if dir.current_is_dir():
            pass
        else:
            #print("loading: " + enemy_texture_dir + texture_file)
            texture = load(enemy_texture_dir + texture_file)
            if texture && texture is Texture: #error occours here
                enemy_texture.append(texture)

        texture_file = dir.get_next()		
func imprimaoi():
	print("oi")