extends KinematicBody2D

export var speed = 200


func _physics_process(delta):
    var move: Vector2
    move.x = delta * speed
    move = move.rotated(rotation)
    move_and_collide(move)
