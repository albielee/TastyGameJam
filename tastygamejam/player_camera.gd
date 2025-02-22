extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var player = get_node("../Player")

	# Make sure the player node exists
	if player:
		# Set the camera position to follow the player
		position.x = player.position.x
		position.y = 0
