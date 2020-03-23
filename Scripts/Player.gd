extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 20 
const ACCELERATION = 50 
const MAX_SPEED = 200
const JUMP_HEIGHT = -550 

var motion = Vector2()

func _physics_process(_delta):
	motion.y += GRAVITY
	var friction = false
	
	if Input.is_action_pressed("right"):
		motion.x = min(motion.x+ACCELERATION, MAX_SPEED)
		$Sprite.flip_h = false 
		$Sprite.play("Run")
	elif Input.is_action_pressed("one"):
		motion.x = max(motion.x-ACCELERATION, -MAX_SPEED)
		$Sprite.flip_h = true 
		$Sprite.play("Run")
	else: 
		$Sprite.play("Idle")
		friction = true
		
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			motion.y = JUMP_HEIGHT
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)
	else:
		if motion.y < 0:
			$Sprite.play("Jump")
		else:
			$Sprite.play("Fall")
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)
	motion = move_and_slide(motion, UP)
	
	if position.y == -600:
		.quit()
	
	
export var stomp_impulse: = 600.0


func _on_EnemyDetector_body_entered(_body: PhysicsBody2D) -> void:
	die()


func die() -> void:
	$PlayerData.deaths += 1
	queue_free()






