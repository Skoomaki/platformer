extends KinematicBody2D

var player_velocity = Vector2(0,-1)

const SPEED = 230
const NORMAL_JUMP_HEIGHT = -1000
const GRAVITY = 37

func _physics_process(delta):
	if Input.is_action_pressed("player_right"): 
		player_velocity.x = SPEED 
		$Sprite.play("walk")
		$Sprite.flip_h = false
	elif Input.is_action_pressed("player_left"): 
		player_velocity.x = -SPEED
		$Sprite.play("walk")
		$Sprite.flip_h = true
	else:
		$Sprite.play("idle")
		
	if not is_on_floor():
			$Sprite.play("air")
	if Input.is_action_just_pressed("player_jump") and is_on_floor():
		player_velocity.y = NORMAL_JUMP_HEIGHT
	
	player_velocity.y = player_velocity.y + GRAVITY
		
	player_velocity = move_and_slide(player_velocity, Vector2.UP)

	player_velocity.x = lerp(player_velocity.x,0,0.11)
