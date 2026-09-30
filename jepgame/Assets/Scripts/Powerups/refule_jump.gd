extends Node2D

@export var respawn_time: float = 10.0

@onready var collision_shape = $Area2D/CollisionShape2D 

func _on_area_2d_body_entered(body):
	if body is jep:
		GameControler.refuled_jump(true)
		self.hide()
		collision_shape.set_deferred("disabled", true)
		await get_tree().create_timer(10).timeout
		self.show()
		collision_shape.set_deferred("disabled", false)
