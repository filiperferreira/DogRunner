extends KinematicBody2D

var speed = Vector2()

func _process(delta):
	fall()
	jump()
	move_and_slide(speed, Vector2(0,-1))

func fall():
	if is_on_floor():
		speed.y = 1
	else:
		speed.y += 10

func jump():
	if Input.is_action_pressed("jump") and is_on_floor():
		speed.y = -250