extends Camera3D

@export var POSITION_TARGET: Node3D
@export var LOOK_TARGET: Node3D
@export var LERP_SPEED: float

var look_angle: Vector3
var distance_to: float	
var new_position: Vector3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	distance_to = position.distance_to(POSITION_TARGET.global_position)
	new_position = lerp(global_position, POSITION_TARGET.global_position, distance_to/(distance_to+LERP_SPEED))
	position = new_position

	
	look_at(LOOK_TARGET.global_position)
