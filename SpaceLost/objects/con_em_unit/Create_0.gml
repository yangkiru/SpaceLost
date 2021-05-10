/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
mPeriod = real(unit_data[? "mPeriod"]);

function enemy_input() {
	switch (state) {
		case States.MoveStop :
			move_target = noone;
			hInput = 0;
			vInput = 0;
			lInput = 0;
			state = States.Idle;
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
	if (move_target == noone || collision_circle(phy_position_x, phy_position_y, rope_length * rope_length_const, move_target, false, true)) {
		state = States.MoveStop;
		if (move_target != noone && object_get_parent(move_target.object_index) == con_ship)
			lInput = 1;
	} else if (move_target != noone && parent == con_em_unit && !in_sequence) { // movement alarm
		var _seq = layer_sequence_create("Instances", x, y, seq_em_movement);
		var _seq_inst = layer_sequence_get_instance(_seq);
		sequence_instance_override_object(_seq_inst, con_em_unit, self);
		layer_sequence_speedscale(_seq, 0.8);
		state = States.Turning;
	}
}
