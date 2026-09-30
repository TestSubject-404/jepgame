extends Node

var total_coins: int = 0


# Called when the node enters the scene tree for the first time.
func coin_collected(value: int):
	total_coins += value
	EventControler.emit_signal("coin_collected", total_coins)
	
func refuled_jump(can_air_jump: bool):
	EventControler.refuled_jump.emit(can_air_jump)
