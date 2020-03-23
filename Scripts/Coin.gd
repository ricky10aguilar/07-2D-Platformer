extends Area2D

onready var PlayerData = $PlayerData
onready var anim_player = $Sprite/AnimationPlayer

export var score: = 100


func _physics_process(_delta):
	var bodies = get_overlapping_bodies()
	for body in bodies: if body.name == "Player":
		picked()
	
func picked() -> void:
	$PlayerData.score += score
	anim_player.play("Picked")
	queue_free()

