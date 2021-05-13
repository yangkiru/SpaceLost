function attack() {
	var bullet = pool.activate_bullet();
	with (bullet) {
		phy_position_x = other.x;
		phy_position_y = other.y;
		phy_rotation = -other.image_angle;
		physics_apply_local_impulse(x, y, 0, -10);
	}
}

image_speed = 0;

parent = obj_player_ship;
offsetX = x - parent.x;
offsetY = y - parent.y;

