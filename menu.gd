extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass



func _on_play_button_pressed():
	Global.goto_scene("res://Pachinko.tscn")


func _on_credits_button_pressed():
	Global.goto_scene("res://Credits.tscn")
