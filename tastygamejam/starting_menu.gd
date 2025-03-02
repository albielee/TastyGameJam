extends Control

@export var time_to_fade_out = 2
@export var wait_after_fade = 1.5

@onready var modulator = $CanvasModulate

var start_game = false

var t = 0.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_anything_pressed():
		start_game = true
	if start_game and t < time_to_fade_out+wait_after_fade:
		if t <= time_to_fade_out:
			modulator.color = Color(
				1-(1*(t/time_to_fade_out)),
				1-(1*(t/time_to_fade_out)),
				1-(1*(t/time_to_fade_out)),
				1
			)
		else:
			modulator.color = Color(
				0,
				0,
				0,
				1
			)
		t += delta
		if t >=  time_to_fade_out+wait_after_fade:
			get_tree().change_scene_to_file("res://game.tscn")
