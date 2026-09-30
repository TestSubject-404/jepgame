extends Control

@onready var label = $Label

# Called when the node enters the scene tree for the first time.
func _ready():
	EventControler.coin_collected.connect(on_event_coin_collected)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func on_event_coin_collected(value: int) -> void:
	label.text = str(value)
func on_event_refuled_jump(can_air_jump: bool) -> void:
	label.text = str(can_air_jump)
