extends Node2D

# 3 colors in each container
# colors will be set randomly in _ready func, 
# also the @ColorBox must be cloned and positioned accurately
# need to add mouse click event listener, 1st will select the giver, 2nd will select the taker


# Create a single container with 5 predefined levels
# Clone these containers as required
# Each level can either be colored or turned invisible 
# However, we need to keep in track the state of the containers. -> Create a class for container?

var containers:Array[StaticBody2D] = []

func _ready():	
	var base_container: StaticBody2D = get_parent().get_node("Node2D/Container")
	containers.append(base_container)
	base_container.clicked.connect(_on_container_clicked)
	var container2 = get_parent().get_node("Node2D/Container").duplicate()
	container2.position.x = 200
	add_child(container2)
	containers.append(container2)
	container2.clicked.connect(_on_container_clicked)
	
	var container3 = get_parent().get_node("Node2D/Container").duplicate()
	container3.position.x = 400
	add_child(container3)
	container3.clicked.connect(_on_container_clicked)
	containers.append(container3)
	pass
	
func _on_container_clicked(container:StaticBody2D):
	print("ROOT detected click on:", container)
	print("Index in array:", containers.find(container))
	
