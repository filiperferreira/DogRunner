extends Node2D

var ground_scene = preload("res://Scenes/Ground.tscn")

func _ready():
	create_ground()

func _process(delta):
	move_ground(delta)

func create_ground():
	for i in range(-256,1430,64):
		var ground = ground_scene.instance()
		ground.position = Vector2(i, 736)
		$GroundFolder.add_child(ground)

func move_ground(delta):
	var ground_array = $GroundFolder.get_children()
	for ground in ground_array:
		ground.position.x -= 256 * delta
		if ground.position.x <= -256:
			ground.queue_free()
			var new_ground = ground_scene.instance()
			new_ground.position = Vector2(ground_array[ground_array.size() - 1].position.x + 64 - 256 * delta, 736)
			$GroundFolder.add_child(new_ground)