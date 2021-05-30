dmg = 1;
owner = noone;
push_force = 0.13;

function push() {
	with(other) {
		physics_apply_impulse(x, y, other.phy_speed_x * other.push_force, other.phy_speed_y * other.push_force);
	}
}