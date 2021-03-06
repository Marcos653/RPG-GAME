extends KinematicBody2D

var velocity: Vector2 = Vector2()
var speed: int = 150
var direction: String = "Down"
var attack: bool = false

onready var AttackPivot = $AttackPivot
onready var WeaponHitbox = $AttackPivot/WeaponHitbox

func _ready():
	WeaponHitbox.disabled = true

func _process(delta):
	attack()
	move()
	move_and_slide(velocity)
	
func move():
	velocity = Vector2()
	if attack == false:
		
		if Input.is_action_pressed("LEFT"):
			direction = "Left"
			velocity.x = -speed	
			get_node("Sprite").play("Left")
			
		elif Input.is_action_pressed("RIGHT"):
			direction = "Right"
			velocity.x = speed
			get_node("Sprite").play("Right")
			
		elif Input.is_action_pressed("UP"):
			direction = "Up"	
			velocity.y = -speed	
			get_node("Sprite").play("Up")
			
		elif Input.is_action_pressed("DOWN"):
			direction = "Down"	
			velocity.y = speed		
			get_node("Sprite").play("Down")	
			
		else:
			idle()	
			
	velocity = velocity.normalized() *speed

func idle():
	if attack == false and direction == "Left":
		$Sprite.play("Left")
		$Sprite.frame = 1
	elif attack == false and direction == "Right":
		$Sprite.play("Right")
		$Sprite.frame = 1	
		
	elif attack == false and direction == "Up":
		$Sprite.play("Up")
		$Sprite.frame = 1	
				
	elif attack == false and direction == "Down":
		$Sprite.play("Down")
		$Sprite.frame = 1		

func attack():
	if Input.is_action_just_pressed("attack"):
		attack = true
		if direction == "Left":
			$Sprite.play("AttackLeft")
			AttackPivot.rotation_degrees = 90
			AttackPivot.position = Vector2(0,0)
			WeaponHitbox.disabled = false
			yield(get_tree().create_timer(0.3), "timeout")
			WeaponHitbox.disabled = true
			attack = false
			
		if direction == "Right":
			$Sprite.play("AttackRight")
			AttackPivot.rotation_degrees = 270
			AttackPivot.position = Vector2(0,5)
			WeaponHitbox.disabled = false
			yield(get_tree().create_timer(0.3), "timeout")
			WeaponHitbox.disabled = true
			attack = false
			
		if direction == "Down":
			$Sprite.play("AttackDown")
			AttackPivot.rotation_degrees = 0
			AttackPivot.position = Vector2(0,0)
			WeaponHitbox.disabled = false
			yield(get_tree().create_timer(0.3), "timeout")
			WeaponHitbox.disabled = true
			attack = false
			
		if direction == "Up":
			$Sprite.play("AttackUp")
			AttackPivot.rotation_degrees = 180
			AttackPivot.position = Vector2(0,5)
			WeaponHitbox.disabled = false
			yield(get_tree().create_timer(0.3), "timeout")
			WeaponHitbox.disabled = true
			attack = false									
