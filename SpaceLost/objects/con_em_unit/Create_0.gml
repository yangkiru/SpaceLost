/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
mPeriod = real(unit_data[? "mPeriod"]);

function enemy_input() {
	switch (state) {
		case States.MoveStop :
			lInput = 0;
			break;
		case States.Idle : // First, Get ride on ship
			if (control == object_index) {
				if (closet_ship != noone) {
					if (distance_to_object(closet_ship) >= (rope_length * rope_length_const)) {
						move_target = closet_ship;
						state = States.Turning;
					} else state = States.MoveStop;
				}
			}
		default :
			if (control == object_index) {
				if (move_target != noone) {
					var dir = point_direction(x, y, move_target.x, move_target.y);
					hInput = lengthdir_x(1, dir);
					vInput = lengthdir_y(1, dir);
				}
			}
	}
}

function enemy_movement() {
	if collision_circle(phy_position_x, phy_position_y, rope_length * rope_length_const, move_target, false, true) {
		state = States.MoveStop;
		alarm[0] = 0;
	} else if (move_target != noone && parent == con_em_unit && alarm[0] < 1) { // movement alarm
		alarm[0] = round(mPeriod * 60);
	}
}