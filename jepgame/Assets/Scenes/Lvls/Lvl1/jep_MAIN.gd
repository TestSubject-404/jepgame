class_name jep extends CharacterBody2D


const SPEED = 450.0
const JUMP_VELOCITY = -800.0
const Test = 67
const dash_speed = 4500
var dash_direction: float = 0.0

var has_dash: bool = true
var is_dashing: bool = false
var is_hovering: bool = false
var can_air_jump: bool = false
var is_dash_cooldown: bool = false
## true = right false = left
var facing_right: bool = true

func _ready() -> void:
	EventControler.refuled_jump.connect(jump_refule)


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("esc"):
		get_tree().change_scene_to_file("res://Main_Menu.tscn")
	if not is_on_floor() and not is_hovering and not is_on_wall():
		velocity += get_gravity() * delta * sqrt(5)
		##print("confuse")
	if not is_on_floor() and not is_hovering and is_on_wall() and velocity.y < 30:
		velocity.y += 30
		##print("not confuse")
	if not is_on_floor() and not is_hovering and is_on_wall() and velocity.y < 0:
		velocity += get_gravity() * delta * sqrt(5)
		##print("confuse2")
	if is_on_floor():
		has_dash = true
	if Input.is_action_just_pressed("Jump") and is_on_floor() or Input.is_action_just_pressed("Jump") and is_hovering or Input.is_action_just_pressed("Jump") and can_air_jump:
		velocity.y = JUMP_VELOCITY
		can_air_jump = false
		is_hovering = false
	if Input.is_action_just_pressed("Dash") and not is_dashing and has_dash:
		is_hovering = false
		dash_direction = sign(velocity.x)
		is_dashing = true
		velocity.x = dash_speed*dash_direction
		can_air_jump = true
		await get_tree().create_timer(.2).timeout
		is_dashing = false
		has_dash = false
		is_hovering = false

	if Input.is_action_just_pressed("Jump") and is_on_wall():
		dash_direction = sign(velocity.x)
		velocity.x = 450*dash_direction
		velocity.y = JUMP_VELOCITY
		
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction and not is_dashing:
		velocity.x = direction * SPEED
		if velocity.x < 0:
			facing_right = false
		elif velocity.x > 0:
			facing_right = true
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	
	move_and_slide()

func jump_refule(value: bool):
	if value:
		can_air_jump = true
		has_dash = true
		is_dash_cooldown = false


func jepattack(body: Node2D) -> void:
	if body is bug:
		velocity.y = 2000
