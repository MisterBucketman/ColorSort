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
var last_selected_color = null
var last_selected_box_index = -1
static var first_selected_container:StaticBody2D = null
var box_state: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	input_pickable = true
	add_to_group("containers")
	
	for n in 4:
		get_child(n+2).get_child(1).color = colors.keys()[randi() % colors.size()]
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
		pass
func _input_event(viewport,event,shape_idx)->void:
	
	
	if event is InputEventMouseButton and event.button_index== MOUSE_BUTTON_LEFT and event.pressed:
		box_state+=1
		print("Clicked container: ", self.name )
		if first_selected_container == null:
			first_selected_container = self
			last_selected_color = null
			last_selected_box_index = -1
			for i in range (7,1,-1):
				var color_box = get_child(i).get_child(1)
				if color_box.color!=Color.WHITE and color_box.color!=null:
					last_selected_color=color_box.color
					last_selected_box_index  = i
					break
				
			print("LastCOLOR: ", last_selected_color)
		else:
			if first_selected_container == self:
				# clicked same container twice
				print("Deselected container: ", self.name)
				first_selected_container = null
				self.last_selected_color = null
				self.last_selected_box_index = -1
			else:
				# transfer color from first container to this container
				first_selected_container._transfer_color_to(self)
				first_selected_container = null
				_check_win()

			
		emit_signal("clicked", self)
	
func _transfer_color_to(target_container)->void:
	if last_selected_color==null:
		return
	for i in range (2,8): #from2to7
		var color_box = target_container.get_child(i).get_child(1)
		if color_box.color == Color.WHITE or color_box.color ==null:
			color_box.color =  last_selected_color
			#set source container to white
			if last_selected_box_index != -1:
				var source_box = get_child(last_selected_box_index).get_child(1)
				source_box.color = Color.WHITE
			last_selected_color = null
			last_selected_box_index = -1
			_check_global_win()
			return
func _check_win()->bool:
	var color1 = get_child(2).get_child(1).color
	var color2 = get_child(3).get_child(1).color
	var color3 = get_child(4).get_child(1).color
	var color4 = get_child(5).get_child(1).color
	var color5 = get_child(6).get_child(1).color
	var color6 = get_child(7).get_child(1).color
	
	# Check all are equal AND not white/null
	if (color1 == color2 and color2 == color3 and color3 == color4 and 
		color4 == color5 and color5 == color6 and color1 != Color.WHITE):
		print("A CONTAINER HAS SAME COLORS")
		return true
	return false
			
func _check_global_win()->bool:
	var containers= get_tree().get_nodes_in_group("containers")
	print(containers)
	for container in containers:
		if not container._check_win():
			return false
		print("GAME WON")
		return true
	return false
			
		
