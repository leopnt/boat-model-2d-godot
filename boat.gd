extends RigidBody2D

func _ready():
	pass

func _process(delta):
	if Input.is_action_pressed("ui_left"):
		apply_central_impulse(delta * Vector2(-300, 0))
	if Input.is_action_pressed("ui_right"):
		apply_central_impulse(delta * Vector2(300, 0))
