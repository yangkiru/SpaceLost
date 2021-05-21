/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

on_destroy = spawn_coin;
ds_map_add(on_destroy_var, "amount", irandom_range(10, 20));

function enemy_input() {
	if (control == object_index)
		closet_ship = instance_empty_ship_nearest(x, y, con_ship, 1);
		closet_ship_dist = get_distance(closet_ship, self, true);
	switch (state) {
		case States.MoveStop :
			move_target = noone;
			hInput = 0;
			vInput = 0;
			state = States.Idle;
			break;
		case States.Moving : case States.Idle :
			if (control == object_index) {
				if (closet_ship != noone) {
					if (closet_ship_dist > rope_length) {
						move_target = closet_ship;
						
						var dir = point_direction(x, y, move_target.x, move_target.y);
						hInput = lengthdir_x(1, dir);
						vInput = lengthdir_y(1, dir);
					} else {
						state = States.MoveStop;
						lInput = 1;
					}
				} else {
					move_target = noone;
					state = States.MoveStop;
				}
			break;
		}
	}
}

function enemy_movement() {
	if (isKey && !in_sequence) {
		var _seq = layer_sequence_create("Instances", x, y, seq_em_movement);
		var _seq_inst = layer_sequence_get_instance(_seq);
		sequence_instance_override_object(_seq_inst, con_em_unit, self);
		layer_sequence_speedscale(_seq, 0.8);
	}
	state = States.Turning;
}