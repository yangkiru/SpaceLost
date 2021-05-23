if (target != noone) {
	t += 0.5 / room_speed;

	phy_position_x = lerp(phy_position_x, target.phy_position_x, t);
	phy_position_y = lerp(phy_position_y, target.phy_position_y, t);
}

if (t >= 0.5) {
	instance_destroy(self);
}
alarm[1] = 1;