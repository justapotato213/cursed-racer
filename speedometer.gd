extends Button

@export var car_body: VehicleBody3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var speed := car_body.linear_velocity.length() * 3.6
	
	text = "%s" %[str(snapped(speed, 0.01))]
