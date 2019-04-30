extends Sprite


var a=1
func _ready():
	rotate(deg2rad(90))
	position=Vector2(0,0)
	set_process(true)
func _process(delta):
	rotation = self.rotation + deg2rad(2000 * delta)
	if(position.x<700&&a):
		translate(Vector2(200*delta,0))
	elif(position.x<200):
		a=1
	else:
		a=0
		translate(Vector2(-200*delta,0))
