class_name jep extends CharacterBody2D


const SPEED = 450.0
const JUMP_VELOCITY = -800.0
const Test = 67
var dash_direction: float = 0.0

var has_dash: bool = true
var is_dashing: bool = false
var is_hovering: bool = false
var can_air_jump: bool = false

func _physics_process(delta: float) -> void:
	if not is_on_floor() and not is_hovering and not is_on_wall():
		velocity += get_gravity() * delta * sqrt(5)
	if not is_on_floor() and not is_hovering and is_on_wall():
		velocity += get_gravity() * delta
	if is_on_floor():
		has_dash = true
	if Input.is_action_just_pressed("Jump") and is_on_floor() or Input.is_action_just_pressed("Jump") and is_hovering or Input.is_action_just_pressed("Jump") and can_air_jump:
		velocity.y = JUMP_VELOCITY
		can_air_jump = false
	if Input.is_action_just_pressed("Dash") and not is_dashing and has_dash:
		can_air_jump = true
		dash_direction = sign(velocity.x)
		is_dashing = true
		velocity.x = 9000*dash_direction
		await get_tree().create_timer(0.067).timeout
		is_dashing = false
		velocity.x = 0
		velocity.y= 0
		is_hovering = true
		await get_tree().create_timer(0.1).timeout
		has_dash = false
		is_hovering = false
		await get_tree().create_timer(0.5).timeout
		can_air_jump = false
	if Input.is_action_just_pressed("Jump") and is_on_wall():
		dash_direction = sign(velocity.x)
		velocity.x = 450*dash_direction
		velocity.y = -440
		
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction and not is_dashing:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
