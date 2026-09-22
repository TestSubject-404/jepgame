extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if Input.is_action_just_pressed("ui_left"):
		Transform2D.FLIP_Y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
