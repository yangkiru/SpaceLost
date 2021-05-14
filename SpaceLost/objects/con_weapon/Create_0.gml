function attack() {
	var bullet = pool.activate_bullet();
	with (bullet) {
		phy_position_x = other.x;
		phy_position_y = other.y;
		phy_rotation = -other.image_angle;
		phy_speed_x = 0;
		phy_speed_y = 0;
		physics_apply_local_impulse(x, y, 0, -10);
		owner = other.owner;
	}
}

function equip_weapon() {
	owner = other.object_index;
	offsetX = x - owner.x;
	offsetY = y - owner.y;
}

image_speed = 0;
owner = noone;
offsetX = 0;
offsetY = 0;