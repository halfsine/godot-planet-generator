extends MeshInstance3D

@export var random : bool
@onready var clouds = $Clouds

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if random:
		randomizeNoise()

func randomizeNoise():
	var material = get_surface_override_material(0)
	var landColor = Color(randf_range(0, 1), randf_range(0, 1), randf_range(0, 1))
	var waterColor = Color(landColor.b, landColor.r, landColor.g)
	
	var cloudColor = waterColor * Color(randf_range(0, 1), randf_range(0, 1), randf_range(0, 1))
	var cloudMaterial = clouds.get_surface_override_material(0)
	
	material.get_shader_parameter("noise").noise.seed = randi()
	material.set_shader_parameter("waterLevel", randf_range(0.92, 0.97))
	material.set_shader_parameter("waterColor", waterColor)
	material.set_shader_parameter("landColor", landColor)
	material.set_shader_parameter("glowingWater", true if randi_range(1, 50) == 1 else false)
	
	cloudMaterial.get_shader_parameter("cloud").noise.seed = randi()
	cloudMaterial.set_shader_parameter("color", cloudColor)
	cloudMaterial.set_shader_parameter("wind", Vector2(randf_range(-0.010, 0.010), randf_range(-0.010, 0.010)))

func _process(delta: float) -> void:
	rotation_degrees.y += 1 * delta
