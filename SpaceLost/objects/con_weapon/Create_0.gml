function attack() {
	var bullet = pool.activate_bullet();
	with (bullet) {
		phy_position_x = other.x;
		phy_position_y = other.y;
		phy_rotation = -other.image_angle;
		phy_speed_x = 0;
		phy_speed_y = 0;
		
		physics_apply_local_impulse(0, 0, 0, -20);
		owner = other.owner;
	}
	is_cool = false;
	alarm[0] = 10;
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

is_cool = true;