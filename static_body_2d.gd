extends StaticBody2D

signal clicked(container)
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
	input_pickable = true
	
	for n in 4:
		get_child(n+2).get_child(1).color = colors.keys()[randi() % colors.size()]
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _input_event(viewport,event,shape_idx)->void:
	print("Im here")
	if event is InputEventMouseButton and event.button_index== MOUSE_BUTTON_LEFT and event.pressed:
		print("Clicked container: ", self.name )
		emit_signal("clicked", self)
	
