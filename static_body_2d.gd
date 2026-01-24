extends StaticBody2D

var colors = {
	Color.RED: "RED",
	#Color.BLUE: "BLUE",
	#Color.GREEN: "GREEN",
	#Color.YELLOW: "YELLOW",
	#Color.ORANGE: "ORANGE",
	Color.PURPLE: "PURPLE",
	Color.CYAN: "CYAN"
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	for n in 4:
		get_child(n+2).get_child(1).color = colors.keys()[randi() % colors.size()]
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
