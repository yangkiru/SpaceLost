// @description Insert description here
anchor = obj_player_ship;
rope_length = global.data[? "player"][? "rope_length"];
mSpd = real(global.data[? "player"][? "mSpd"]);
mSpd_const = real(global.data[? "player"][? "mSpd_const"]);
rope_length = real(rope_length);
rope_rot_spd = global.data[? "player"][? "rope_rot_spd"];
rope_ready = false;
rope = -1;
rope_rot = 0;

move_target = -1;
target_x = -1;
target_y = -1;
grab = -1;

control = true;
move = true;