extends Node2D

var ground_scene = preload("res://Scenes/Ground.tscn")

func _ready():
	create_ground()

func _process(delta):
	move_ground(delta)

func create_ground():
	for i in range(0,1430,64):
		var ground = ground_scene.instance()
		ground.position = Vector2(i, 736)
		$GroundFolder.add_child(ground)

func move_ground(delta):
	for ground in $GroundFolder.get_children():
		ground.position.x -= 32 * delta
		if ground.position.x <= -32:
			ground.queue_free()
			var new_ground = ground_scene.instance()
			new_ground.position = Vector2(1430, 736)
			$GroundFolder.add_child(new_ground)