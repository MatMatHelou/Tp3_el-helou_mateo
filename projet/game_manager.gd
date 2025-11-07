extends Node

@onready var pointslabel: Label = %Pointslabel

var points = 0

func add_point():
	points += 1
	print(points)
	pointslabel.text = "Points: " + str(points)
	
