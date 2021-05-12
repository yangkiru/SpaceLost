if grab == -2
	grab = -1;
	
if (control != object_index && state == States.Idle && phy_speed > 1) { // head to ship
	
	var dir = point_direction(0, 0, phy_speed_x, -phy_speed_y) + 90;
	var rspeed = 5;
	phy_rotation += sin(degtorad(dir - phy_rotation)) * rspeed;
}

if (rope != noone && t_rope <= 1) {
	t_rope += delta_time * 0.00000005;
	if (t_rope > 1) t_rope = 1;
	physics_joint_set_value(rope, phy_joint_max_length, lerp(physics_joint_get_value(rope, phy_joint_max_length), rope_length, t_rope) * 0.01);
}