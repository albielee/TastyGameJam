extends Node2D

@onready var darkness = $Darkness_modulate
@onready var tutorial_timer = $UI_Layer/Timer
@onready var ui_fade = $UI_Layer/CanvasModulate

@export var fade_in_rate = 0.02
@export var tutorial_text_delay = 3

var target_brightness
var brightness = 0
var fade_in_tut = false
var fade_out_tut = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	target_brightness = darkness.color[0]
	darkness.color = Color(brightness, brightness, brightness, 255)
	tutorial_timer.wait_time = tutorial_text_delay
	tutorial_timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if brightness < target_brightness:
		brightness += delta * fade_in_rate
		darkness.color = Color(brightness, brightness, brightness, 255)
	if fade_out_tut:
		if ui_fade.color[3] > 0:
			ui_fade.color[3] -= delta * 0.15
	elif fade_in_tut:
		if ui_fade.color[3] < 1:
			ui_fade.color[3] += delta * 0.1


func _on_timer_timeout() -> void:
	fade_in_tut = true

func _on_candle_start_game() -> void:
	fade_out_tut = true
