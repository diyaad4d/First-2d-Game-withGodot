extends Area2D


var travelled_distance=0

func _physics_process(delta):
	const SPEED=1000
	const Range=1200
	var direction=Vector2.RIGHT.rotated(rotation)
	position+=direction*SPEED*delta
	
	travelled_distance+=SPEED*delta
	
	if travelled_distance>Range:
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	queue_free()
	if body.has_method("take_damge"):
		body.take_damge()
