// unit_data = global.data[? "unit_name"];
rope_length = real(unit_data[? "rope_length"]);
mSpd = real(unit_data[? "mSpd"]);
mSpd_const = real(unit_data[? "mSpd_const"]);
tSpd = real(unit_data[? "tSpd"]);
tSpd_const = real(unit_data[? "tSpd_const"]);
rope_rot_spd = real(unit_data[? "rope_rot_spd"]);
rope_circle_alpha = real(unit_data[? "rope_circle_alpha"]);
rope = -1;
rope_rot = 0;
connected = noone;

move_target = noone;
target_x = -1;
target_y = -1;
grab = -1;

control = self;
camera_zoom = 1;

t = 0;

function target_spr(spr) {
	if (sprite_index != spr) {
		sprite_index = spr;
		image_index = 0;
	}
}