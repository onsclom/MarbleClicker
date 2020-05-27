extends Control

onready var marbleText =  $MarginContainer/VBoxContainer/marbles
onready var levelText = $MarginContainer/VBoxContainer/level

onready var progress = $MarginContainer/VBoxContainer/CenterContainer/ProgressBar

const plusOne = preload("res://plusOne.tscn")

var marbles = 0

var level = 1

var experience = 0
var experienceNeeded = 10

var factories = 0

var timePassed = 0

func _ready():
	experienceNeeded = 10
	pass # Replace with function body.


func _process(delta):
	timePassed += delta
	
	if timePassed > 1:
		timePassed -= 1
		for x in range(factories):
			marbles += 1
			experience += 1
			var newPlus = plusOne.instance()
			add_child(newPlus)
	
	marbleText.text = "marbles: " + str(marbles)
	levelText.text = "level: " + str(level)

	if experience >= experienceNeeded:
		level += 1
		experience -= experienceNeeded
		experienceNeeded = pow(2,level) * 10
		
	# set thing
	print("experience" + str(experience))
	print("needed" + str(experienceNeeded))
	progress.value = float(experience)/float(experienceNeeded)


func _on_Button_pressed():
	marbles += 1
	experience += 1
	var newPlus = plusOne.instance()
	add_child(newPlus)
	pass # Replace with function body.


func _on_Button_pressed_Factory():
	if marbles > 10:
		marbles -= 10
		factories += 1
	pass # Replace with function body.
