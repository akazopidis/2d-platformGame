extends CharacterBody2D

var velocity = Vector2(0,0)
var coins = 0
const SPEED = 180
const GRAVITY = 35
const JUMPFORCE = -1100

func _physics_process(delta):
	if Input.is_action_pressed("right"):
		velocity.x = SPEED
		$Sprite2D.play("walk")
		$Sprite2D.flip_h = false
	elif Input.is_action_pressed("left"):
		velocity.x = -SPEED
		$Sprite2D.play("walk")
		$Sprite2D.flip_h = true
	else:
		$Sprite2D.play("idle")
	if not is_on_floor():
		$Sprite2D.play("air")
		
	velocity.y = velocity.y + GRAVITY
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMPFORCE
	
	set_velocity(velocity)
	set_up_direction(Vector2.UP)
	move_and_slide()
	velocity = velocity
	
	velocity.x = lerp(velocity.x,0,0.2)
	



func _on_fallzone_body_entered(body):
	get_tree().change_scene_to_file("res://Level1.tscn")


