// @description Insert description here
global.player_unit = self;
ship = obj_player_ship;
rope_length = global.data[? "player"][? "rope_length"];
mSpd = real(global.data[? "player"][? "mSpd"]);
mSpd_const = real(global.data[? "player"][? "mSpd_const"]);
rope_length = real(rope_length);
rope_rot_spd = real(global.data[? "player"][? "rope_rot_spd"]);
rope_circle_alpha = real(global.data[? "player"][? "rope_circle_alpha"]);
rope = -1;
rope_graphic = -1;
rope_rot = 0;
connected = noone;

move_target = noone;
target_x = -1;
target_y = -1;
grab = -1;

control = true;

state = States.Idle;
t = 0;

enum States {
	Idle, MoveStart, Moving, MoveStop
}

depth = 0;

//dummy = instance_create(x, y, con_dummy);