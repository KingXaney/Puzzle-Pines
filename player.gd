extends CharacterBody2D


const SPEED = 500.0
const JUMP_VELOCITY = -500
const DAMPING = 0.02
var dead = false
signal tellDead
var playerLocked = false
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
var direction



func _physics_process(delta: float) -> void:
	if !dead and !playerLocked:
		# Add the gravity.
		if not is_on_floor():
			velocity += get_gravity() * delta

		# Handle jump.
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		direction = Input.get_axis("move_left", "move_right")
		
		
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		
		move_and_slide()

func _process(delta: float):
	if direction > 0:
		animated_sprite.flip_h = false 
	elif direction < 0:
		animated_sprite.flip_h = true 
		
		# Play animations 
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")

func _on_textboxes_kill_player():
	if !dead:
		dead = true
		tellDead.emit(dead)
		$DeathParticles.emitting = true
		$ThinkParticles.emitting = false
		$AnimatedSprite2D.hide()
		$DeathTimer.start()
		await $DeathTimer.timeout
		dead=false
		tellDead.emit(dead)
		$DeathParticles.emitting = false
		$AnimatedSprite2D.show()
		position.x=421
		position.y=145
		playerLocked=false
		print(playerLocked)
	


func _on_lock_player(lockUnlock: bool):
	playerLocked = lockUnlock
	direction=0
	if lockUnlock: $ThinkParticles.emitting = true
	if !lockUnlock: $ThinkParticles.emitting = false
