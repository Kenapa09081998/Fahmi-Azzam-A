extends CharacterBody2D

const SPEED = 300.0
const SHOOT_TIME = 0.5

@onready var timer: Timer = Timer.new()
@onready var heart: Node2D = %Heart

const BULLET = preload("res://src/scene/bullet.tscn")
const MENU = "res://src/scene/Menu.tscn"

func _ready() -> void:
	timer.wait_time = SHOOT_TIME
	timer.one_shot = true
	add_child(timer)

func _physics_process(delta: float) -> void:
	move(delta)
	shoot()

func move(delta):
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if direction:
		velocity = Vector2(direction) * SPEED
	else:
		velocity = velocity.move_toward(Vector2.ZERO, (SPEED * 4) * delta)

	move_and_slide()

func shoot():
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		if not timer.is_stopped():
			return
		else:
			var bullet = BULLET.instantiate()
			bullet.DIRECTION = Vector2.RIGHT
			bullet.position = position
			bullet.TARGET = 'enemy'
			
			get_parent().add_child(bullet)
		timer.start()

func get_hit():
	heart.hit()

func death():
	SceneTransition.change_scene(MENU)
