extends StaticBody2D

@onready var candlelight = $CandleLight;
@onready var lit_sprite = $Lit_sprite;

@export var STABLE_CANDLE_BRIGHTNESS = 2;
@export var CANDLE_RECOVERY = 0.02;
@export var CANDLE_STABLE_CHANGE = 0.02 ;

var is_lit = false

var current_candle_brightness = 0;

func _ready() -> void:
	if is_lit:
		current_candle_brightness = STABLE_CANDLE_BRIGHTNESS
		lit_sprite.visible = true

func _process(_delta: float) -> void:
	if is_lit:
		if current_candle_brightness != STABLE_CANDLE_BRIGHTNESS:
			current_candle_brightness +=  (STABLE_CANDLE_BRIGHTNESS - current_candle_brightness)*CANDLE_RECOVERY
		
		#add some randomness
		current_candle_brightness += randf_range(-CANDLE_STABLE_CHANGE, CANDLE_STABLE_CHANGE) * current_candle_brightness
		
		candlelight.energy = current_candle_brightness

func light():
	is_lit = true
	lit_sprite.visible = true
