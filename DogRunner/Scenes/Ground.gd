extends Node2D

var barrier_scene = preload("res://Scenes/Barrier.tscn")

func _ready():
	randomize()
	var chance = randi()%10 + 1
	if chance == 10:
		create_barrier()

func create_barrier():
	var barrier = barrier_scene.instance()
	barrier.position = Vector2(0,-64)
	add_child(barrier)