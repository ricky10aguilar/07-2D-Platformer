extends Area2D


func _on_Area2D_body_entered(body: PhysicsBody2D) -> void:
	die()

func die() -> void:
	$PlayerData.deaths += 1
	queue_free()
