extends CharacterBody2D

@export var speed = 100
@onready var animated_sprite = $AnimatedSprite2D


func player_move():
	var movement = Input.get_vector("left","right","up","down")
	velocity = movement * speed
	
	if movement.x == 0 and movement.y == 0:
		print("Idle")
		animated_sprite.play("idle")
		
	if movement.x == -1:
		print("Moved left")
		animated_sprite.flip_h = true
		animated_sprite.play("run_right")	
		
	elif movement.x == 1:
		print("Moved right")
		animated_sprite.flip_h = false	
		animated_sprite.play("run_right")
		
	if movement.y == -1:
		print("Moved up")
		animated_sprite.play("run_right")
		
	elif movement.y == 1:
		print("Moved down")
		animated_sprite.play("run_right")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	player_move()
	move_and_slide()
	
