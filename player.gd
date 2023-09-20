extends RigidBody2D

@export var textBox : Label
@export var gameOver : Label

var setup = true;
var won = false;
var moveSpeed = 80;
var direction = 0;
var points = 0

var numBalls = 3

var spawnPoint = Vector2(600, 100)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _physics_process(_delta):
	if setup:
		direction = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
		linear_velocity = Vector2(moveSpeed * direction, 0)
		if Input.is_action_pressed("ui_accept"):
			gravity_scale = 1
			setup = false
			numBalls -= 1
			textBox.text = "Points: " + str(points) + "\nBalls: " + str(numBalls)

func _on__body_entered(body, extra_arg_0):
	if not won:
		if body.name == "Player":
			points += extra_arg_0

			print("Player won " + str(extra_arg_0) + " points!")
			won = true
			textBox.text = "Points: " + str(points) + "\nBalls: " + str(numBalls)

			await get_tree().create_timer(3.0).timeout
			
			if numBalls > 0:
				self.move_local_x(550)
				self.move_local_y(50)
				self.gravity_scale = 0
				self.freeze = true
				self.global_transform.origin = spawnPoint
				self.freeze = false
				won = false
				setup = true
			else:
				print("Game over!")
				gameOver.visible = true
