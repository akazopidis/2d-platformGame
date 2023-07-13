extends CharacterBody2D

#ousiastika exoume metablhth pou exei X,Y idiothta pou mporei na 
#apothikeush dejia kai aristera speed kathws kai up and down speed
var velocity = Vector2()
@export var direction = -1
@export var detects_cliffs = true
var speed = 50


func _ready():
	if direction == 1:
		$AnimatedSprite2D.flip_h = true
	$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction
	$floor_checker.enabled = detects_cliffs
	

#in order gia na doulepsi gravity kai velocity theloume aauthn edw th methodo0
# oti kwdika valeis edw mesa leitourgei 60times/per sec
func _physics_process(delta):
	
	if is_on_wall() or not $floor_checker.is_colliding() and detects_cliffs and is_on_floor():
		direction = direction * -1
		$AnimatedSprite2D.flip_h = not $AnimatedSprite2D.flip_h
		$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction
		
	
	velocity.y += 20
	
	velocity.x = speed * direction
	
	#tou actually move
	velocity = move_and_slide (velocity,Vector2.UP)

	


func _on_top_checker_body_entered(body):
	$AnimatedSprite2D.play("squashed")
	speed = 0
	set_collision_layer_value(4,false)
	set_collision_mask_value(0,false)
	$top_checker.set_collision_layer_value(4,false)
	$top_checker.set_collision_mask_value(0,false)
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
