extends CharacterBody2D


const speed = 1500.0
const accel = 10.0

@onready var navigator : NavigationAgent2D = $NavigationAgent2D

var actual_position = "" 
var actual_target 
var move = false
var direction = Vector2 ()

var pos = Vector2(247, 691)

func _ready():
	actual_position = "boat_deck"

func _physics_process(delta):
	if move:
		direction = navigator.get_next_path_position() - global_position 
		var distance = pos - global_position 
		direction = direction.normalized()
		velocity = velocity.lerp(direction * speed, accel * delta)
		
		if distance.length() > 1:
			move_and_slide()
		else:
			move = false
			actual_target = ""


func moveit():
	move = true
	navigator.target_position = pos
