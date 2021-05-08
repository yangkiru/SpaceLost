// @description Insert description here
global.player_unit = self;
ship = obj_player_ship;
rope_length = global.data[? "player"][? "rope_length"];
mSpd = real(global.data[? "player"][? "mSpd"]);
mSpd_const = real(global.data[? "player"][? "mSpd_const"]);
tSpd = real(global.data[? "player"][? "tSpd"]);
tSpd_const = real(global.data[? "player"][? "tSpd_const"]);
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

control = self;
camera_zoom = 1;

state = States.Idle;
t = 0;

enum States {
	Idle, MoveStart, Moving, MoveStop, Turning
}

depth = 0;
connector = obj_connector;

function target_spr(spr) {
	if (sprite_index != spr) {
		sprite_index = spr;
		image_index = 0;
	}
}