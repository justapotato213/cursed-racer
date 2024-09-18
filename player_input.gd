extends VehicleBody3D

@export var ENGINE_FORCE_VALUE: int
@export var MAX_GRIP: int
@export var STEER_LIMIT: float
@export var BRAKE_FORCE_VALUE: int
@export var ACCELERATION_BOOST: float
@export var ACCELERATION_BOOST_LIMIT: float
@export var REVERSE_SPEED_LIMIT: float

var grip: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_process(get_multiplayer_authority() == multiplayer.get_unique_id())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	steering = remap(Input.get_axis("turn_right", "turn_left"), -1, 1, -STEER_LIMIT, STEER_LIMIT)
	
	# give acceleration boost while they are below a certain speed
	if (linear_velocity.length() * 3.6 < ACCELERATION_BOOST_LIMIT):
		engine_force = Input.get_action_strength("accelerate") * ENGINE_FORCE_VALUE * ACCELERATION_BOOST
	else:
		engine_force = Input.get_action_strength("accelerate") * ENGINE_FORCE_VALUE
	
	# handle reverse
	if (linear_velocity.length() * 3.6 > 0.1):
		brake = Input.get_action_strength("brake") * BRAKE_FORCE_VALUE
	
	if (Input.get_action_strength("flip") == 1):
		transform.basis = Basis()
		
		rotate_object_local(Vector3(0, 1, 0), PI)
