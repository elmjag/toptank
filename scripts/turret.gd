extends KinematicBody2D

export var turn_speed = 2
export (PackedScene) var bullet


func _input(event):
    if not event.is_action_pressed("fire"):
        return

    var base = get_parent()
    var bullet_offset = Vector2(100, 0).rotated(base.rotation + rotation)

    var new_bullet = bullet.instance()
    new_bullet.position = base.position + position + bullet_offset
    new_bullet.rotation = base.rotation + rotation

    get_node("/root").add_child(new_bullet)


func _physics_process(delta):
    var left = Input.get_action_strength("turret_left")
    var right = Input.get_action_strength("turret_right")
    var turn = (right - left) * turn_speed * delta

    rotate(turn)
