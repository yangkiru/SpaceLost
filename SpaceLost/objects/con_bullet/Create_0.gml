dmg = 1;
owner = noone;
kb_force = 0.13;
pierce = 1;

function push(force) {
	with(other) {
		var f = const_kb * other.kb_force;
		physics_apply_impulse(x, y, other.phy_speed_x * f, other.phy_speed_y * f);
	}
}