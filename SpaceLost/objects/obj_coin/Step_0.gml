if (phy_speed < 1 && target != noone) {
	t += 1 / room_speed;

	phy_position_x = lerp(phy_position_x, target.phy_position_x, t);
	phy_position_y = lerp(phy_position_y, target.phy_position_y, t);
	
}

if (t >= 0.8) {
	instance_destroy(self);
}