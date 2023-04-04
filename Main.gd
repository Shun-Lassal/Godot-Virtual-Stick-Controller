extends Node2D

@onready var Analog = get_child(1)
@onready var CharBody = get_child(2)
@onready var Camera = get_child(0)
var controlsFollows = true #The controls will follow the player
var cameraFollows = true #The camera will follow the player but not the controls

# Called when the node enters the scene tree for the first time.
func _ready():
	print(CharBody)
	print(Camera)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	CharBody.move_and_collide(delta * -Analog.directionValue * 2.5)
#The camera and controller follows 
	if controlsFollows == true:
		Analog.position = Camera.position
	
	if cameraFollows == true: 
		Camera.position = lerp(Camera.position, CharBody.position, 0.5)
#	print(Analog.directionValue)
	
	pass
