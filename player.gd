extends CharacterBody2D

signal health_depleted
var health=100.0


func _physics_process(delta):
	var direction=Input.get_vector("move_left","move_right","move_up","move_down")
	velocity=direction*600.0
	move_and_slide()
	
	if velocity.length()>0.0:
		get_node("HappyBoo").play_walk_animation()
	else:
		#     $HappyBoo.play_idle_animation()
		%HappyBoo.play_idle_animation()
	
	const DAMGE_RATE=5.0
	var overlapping_mob=%HurtBox.get_overlapping_bodies()
	if overlapping_mob.size()>0:
		health-=DAMGE_RATE*overlapping_mob.size()*delta
		%ProgressBar.value=health
		if health<=0.0:
			health_depleted.emit()
			
	   
	
	
