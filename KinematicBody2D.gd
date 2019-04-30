extends KinematicBody2D

const UP = Vector2(0,-1)
var motion = Vector2()
func _physics_process(delta):
	motion.y+=10
	scale=Vector2(1,1)
	if is_on_floor():
		if Input.is_action_pressed("ui_right"):
			motion.x=12500*delta
			$Sprite.flip_h=false
			$Sprite.play("run")
		elif Input.is_action_pressed("ui_left"):
			$Sprite.flip_h=true
			motion.x=-12500*delta
			$Sprite.play("run")
		else:
			motion.x=0
			$Sprite.play("idle")
		if Input.is_action_just_pressed("ui_up"):
			$Sprite.play("jump")
			motion.y=-25000*delta
		if Input.is_action_pressed("ui_right")&&Input.is_action_pressed("ui_down"):
			scale = Vector2(1,0.7)
			$Sprite.play("slide")
			motion.x=13500*delta
			$Sprite.flip_h=false
		if Input.is_action_pressed("ui_left")&&Input.is_action_pressed("ui_down"):
			scale = Vector2(1,0.7)
			$Sprite.play("slide")
			motion.x=-13500*delta
			$Sprite.flip_h=true
	else:
		if Input.is_action_pressed("ui_right"):
			motion.x=12500*delta
			$Sprite.flip_h=false
			$Sprite.play("run")
		elif Input.is_action_pressed("ui_left"):
			$Sprite.flip_h=true
			motion.x=-12500*delta
			$Sprite.play("run")
		else:
			motion.x=0
			$Sprite.play("jump")
	move_and_slide(motion,UP)