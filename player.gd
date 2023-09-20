extends RigidBody2D

@export var textBox : Label
@export var gameOver : Label
@export var playAgain : Button

var setup = true;
var won = false;
var moveSpeed = 80;
var direction = 0;
var points = 0

var totalBalls = 2

var balls = totalBalls

var spawnPoint = Vector2(550, 50)

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
			balls -= 1
			textBox.text = "Points: " + str(points) + "\nBalls: " + str(balls)

func resetBall():
	print("Moving ball...")
	self.gravity_scale = 0
	self.freeze = true
	self.global_transform.origin = spawnPoint
	self.freeze = false
	setup = true
	won = false

func updateScore():
	textBox.text = "Points: " + str(points) + "\nBalls: " + str(balls)

func _on__body_entered(body, extra_arg_0):
	if not won:
		if body.name == "Player":
			points += extra_arg_0

			print("Player won " + str(extra_arg_0) + " points!")
			won = true
			updateScore()

			await get_tree().create_timer(3.0).timeout
			
			if balls > 0:
				resetBall()
			else:
				resetBall()
				print("Game over!")
				gameOver.visible = true
				playAgain.visible = true

func _on_play_again_pressed():
	points = 0
	balls = totalBalls
	updateScore()
	gameOver.visible = false
	playAgain.visible = false