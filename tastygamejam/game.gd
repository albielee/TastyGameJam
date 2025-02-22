extends Node2D

@onready var darkness = $Darkness_modulate

@export var fade_in_rate = 0.3

var target_brightness
var brightness = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	target_brightness = darkness.color[0]
	darkness.color = Color(brightness, brightness, brightness, 255)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if brightness < target_brightness:
		brightness += delta * fade_in_rate
		darkness.color = Color(brightness, brightness, brightness, 255)
