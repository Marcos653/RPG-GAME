extends KinematicBody2D

var velocity: Vector2 = Vector2()
var speed: int = 150

func _process(delta):
	move()
	move_and_slide(velocity)
	
func move():
	velocity = Vector2()
	if Input.is_action_pressed("LEFT"):
		velocity.x = -speed	
		get_node("Sprite").play("Left")
	elif Input.is_action_pressed("RIGHT"):
		velocity.x = speed
		get_node("Sprite").play("Right")
	elif Input.is_action_pressed("UP"):
		velocity.y = -speed	
		get_node("Sprite").play("Up")
	elif Input.is_action_pressed("DOWN"):
		velocity.y = speed		
		get_node("Sprite").play("Down")
	else:
		get_node("Sprite").frame = 1	
	velocity = velocity.normalized() *speed
