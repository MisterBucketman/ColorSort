extends Node2D

# 3 colors in each container
# colors will be set randomly in _ready func, 
# also the @ColorBox must be cloned and positioned accurately
# need to add mouse click event listener, 1st will select the giver, 2nd will select the taker


# Create a single container with 5 predefined levels
# Clone these containers as required
# Each level can either be colored or turned invisible 
# However, we need to keep in track the state of the containers. -> Create a class for container?

@onready var ColorBox = $ColorBox

#var colors = {
	#Color.RED: "RED",
	##Color.BLUE: "BLUE",
	##Color.GREEN: "GREEN",
	##Color.YELLOW: "YELLOW",
	##Color.ORANGE: "ORANGE",
	#Color.PURPLE: "PURPLE",
	#Color.CYAN: "CYAN"
#}

func _ready():
	#ColorBox.get_child(1).color = colors.keys()[randi() % colors.size()]
	
	var container2 = get_parent().get_node("Node2D/Container").duplicate()
	container2.position.x = 200
	add_child(container2)
	
	var container3 = get_parent().get_node("Node2D/Container").duplicate()
	container3.position.x = 400
	add_child(container3)
	
	
	pass
