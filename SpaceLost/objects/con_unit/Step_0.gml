//instance_nth_nearest(x, y, con_ship, 1);

// Closet Ship
if (control == self) {
	closet_ship = instance_empty_ship_nearest(x, y, con_ship, 1);
	if (closet_ship != noone)
		closet_ship_dist = get_distance(closet_ship, self, true);
}
// Inputs
if (control.owner.object_index == obj_player_unit) {
	player_input();
} else if (parent == con_em_unit && control == self) {
	enemy_input();
}

// Inits
isKey = hInput != 0 || vInput != 0;
image_speed = 1;

if (control == self) {
	// Idle
	if (isKey)
		turn();
	if (!isKey && is_animation_end())
		target_spr(grab ? spr_idle_grab : spr_idle);
	else if (isKey) {
		target_spr(grab ? spr_swim_grab : spr_swim);
		move();
	}
} else {
	if (phy_speed > 5) {
		target_spr(spr_fly);
		image_speed = phy_speed * 0.05;
	} else {
		target_spr(grab ? spr_idle_grab : spr_idle);
	}
}

// Connect
if (lInput) {
	connect_rope();
}
// Oxygen
if (control.parent != con_ship)
	oxygen = max(0, oxygen - oxygen_usage / room_speed);
else
	oxygen = oxygen_max;