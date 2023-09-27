extends Node

var savePath = "user://score.save"
var highScores = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func saveScores():
	highScores.sort()
	highScores.reverse()
	var file = FileAccess.open(savePath, FileAccess.WRITE)
	file.store_var(highScores)

func load_score():
	if FileAccess.file_exists(savePath):
		print("File found!")
		var file = FileAccess.open(savePath, FileAccess.READ)
		highScores = file.get_var()
	else:
		print("File found.")
