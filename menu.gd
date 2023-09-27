extends Node

var savePath = Savemanager.savePath
@export var leaderboard : Label

# Called when the node enters the scene tree for the first time.
func _ready():
	Savemanager.load_score()

	leaderboard.text = "Leaderboard:\n"
	var index = 1
	for score in Savemanager.highScores:
		print(str(score) + ", ")
		if index <= 5:
			leaderboard.text += str(index) + ". " + str(score) + "\n"
			index += 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
		

func _on_play_button_pressed():
	Global.goto_scene("res://Pachinko.tscn")


func _on_credits_button_pressed():
	Global.goto_scene("res://Credits.tscn")
