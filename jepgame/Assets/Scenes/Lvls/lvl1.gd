extends Node2D

@export var value: int = 1
# Called when the node enter the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is jep:
		GameControler.coin_collected(value)
		self.queue_free()
