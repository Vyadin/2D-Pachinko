extends Node

@export var gameMusic : AudioStream
@export var menuMusic : AudioStream

# Called when the node enters the scene tree for the first time.
func _ready():
	self.stream = menuMusic


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
