extends Node2D

var isHolding = false
var holdingPosition = Vector2.ZERO
var analogPosition = Vector2.ZERO
@export var directionValue = Vector2.ZERO
@onready var holdingSpriteDir = preload("res://icon.svg")
@onready var analogSpriteDir = preload("res://icon.svg")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) && isHolding == false:

		isHolding = true
		holdingPosition = get_local_mouse_position()

		var holdingSprite = Sprite2D.new()
		add_child(holdingSprite)
		holdingSprite.position = holdingPosition
		holdingSprite.texture = holdingSpriteDir

		var analogSprite = Sprite2D.new()
		add_child(analogSprite)
		analogSprite.position = holdingPosition
		analogSprite.texture = analogSpriteDir
		analogSprite.modulate = "ff7f8873" 
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) && isHolding == true:
		var holdingSprite = get_child(0)
		var analogSprite = get_child(1)
		analogPosition = get_local_mouse_position()
		analogPosition.x = clamp(analogPosition.x, holdingSprite.position.x - 100, holdingSprite.position.x + 100)
		analogPosition.y = clamp(analogPosition.y, holdingSprite.position.y - 100, holdingSprite.position.y + 100)
		analogSprite.position = analogPosition
		directionValue = holdingPosition - analogPosition
		
		pass
	
	if !Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		isHolding = false
		directionValue = lerp(directionValue, Vector2(0,0), 0.5)
		if get_child(0):
			get_child(0).queue_free()
			get_child(1).queue_free()
		pass
#	print(directionValue)
	pass
