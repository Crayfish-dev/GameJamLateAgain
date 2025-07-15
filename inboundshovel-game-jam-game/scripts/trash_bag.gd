extends Area2D

@onready var particles: GPUParticles2D = $GPUParticles2D
@onready var sprite: Sprite2D = $Sprite2D
@onready var area: Area2D = $"."



func _on_body_entered(body: CharacterBody2D) -> void:
	if body.name == "Player":
		area.monitoring = false
		area.monitorable = false
		body.stun(200, 0, 0.5)
		body.direction = 0
		particles.emitting = true
		sprite.visible = false
		await get_tree().create_timer(0.5).timeout
		queue_free()
		
