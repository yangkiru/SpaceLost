dmg = 1;
owner = noone;
push_force = 0.13;

function push(force) {
	with(other) {
		physics_apply_impulse(x, y, other.phy_speed_x * force, other.phy_speed_y * force);
	}
}