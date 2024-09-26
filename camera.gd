extends Camera3D

var lookPos : Vector3

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var mousePosition = get_viewport().get_mouse_position()
	var viewportSize = get_viewport().size
	var mousePositionCorrected = -Vector3(mousePosition.y - viewportSize.y * 0.5, mousePosition.x - viewportSize.x * 0.5, 0) * 0.02
	rotation_degrees = rotation_degrees.lerp(mousePositionCorrected, delta * 10)

func _physics_process(delta: float) -> void:
	var vector = Input.get_vector("left", "right", "up", "down") * 50
	get_parent().rotation_degrees.y += vector.x * delta
	get_parent().rotation_degrees.x += vector.y * delta
