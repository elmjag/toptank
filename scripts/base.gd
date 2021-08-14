extends KinematicBody2D

export var turn_speed = 2.2
export var move_speed = 220


func _physics_process(delta):
    #
    # rotate
    #
    var right = Input.get_action_strength("turn_right")
    var left = Input.get_action_strength("turn_left")
    var turn = (right - left) * delta * turn_speed
    rotate(turn)

    #
    # move
    #
    var up = Input.get_action_strength("forward")
    var down = Input.get_action_strength("reverse")
    var move: Vector2
    move.x = (up - down) * delta * move_speed
    move = move.rotated(rotation)
    move_and_collide(move)
