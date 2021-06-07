/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

on_destroy = spawn_coin;
ds_map_add(on_destroy_var, "amount", irandom_range(10, 15));

function enemy_input() {
	if (control == self) {
		closet_ship = instance_empty_ship_nearest(x, y, con_ship, 1);
		if (closet_ship != noone)
			closet_ship_dist = get_distance(closet_ship, self, true);
		else {
			show_debug_message("ship lost");
			//move_target = obj_player_unit.control;
			//var dir = point_direction(x, y, move_target.x, move_target.y);
			//hInput = lengthdir_x(1, dir);
			//vInput = lengthdir_y(1, dir);
		}
	}
	
	if (control == self) {
		if (closet_ship != noone) {
			if (closet_ship_dist > rope_length) {
				move_target = closet_ship;
						
				var dir = point_direction(x, y, move_target.x, move_target.y);
				hInput = lengthdir_x(1, dir);
				vInput = lengthdir_y(1, dir);
			} else {
				lInput = 1;
			}
		} else {
			move_target = noone;
	}
	
	switch (state) {
		case States.MoveStop :
			move_target = noone;
			hInput = 0;
			vInput = 0;
			state = States.Idle;
			break;
		case States.Moving : case States.Idle :
			if (control == self) {
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
}

function move() {
	enemy_movement();
}

function enemy_movement() {
	if (isKey && !in_sequence) {
		show_debug_message("!!!!!!!!!!!!!!!!!!");
		var _seq = layer_sequence_create("Instances", x, y, seq_em_movement);
		var _seq_inst = layer_sequence_get_instance(_seq);
		sequence_instance_override_object(_seq_inst, con_em_unit, self);
		layer_sequence_speedscale(_seq, 0.8);
	}
}