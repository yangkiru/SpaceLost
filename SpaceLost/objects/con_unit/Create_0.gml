// unit_data = global.data[? "unit_name"];
rope_length = real(unit_data[? "rope_length"]);
mSpd = real(unit_data[? "mSpd"]);
mSpd_const = real(unit_data[? "mSpd_const"]);

rope = noone;
rope_rot = 0;
connected = noone;

move_target = noone;
target_x = -1;
target_y = -1;
grab = -1;

hInput = 0;
vInput = 0;
lInput = 0;

control = object_index;
owner = object_index;
camera_zoom = 1;

t = 0;

state = States.Idle;

spr_swim = noone;
spr_swim_grab = noone;
spr_idle = noone;
spr_idle_grab = noone;
spr_fly = noone;

function target_spr(spr) {
	if (sprite_index != spr && spr != noone) {
		sprite_index = spr;
		image_index = 0;
	}
}

function connect_rope() {
	if (control == object_index) {
		var closet_ship = instance_nth_nearest(x, y, con_ship, 1);
		if (closet_ship.control == noone && distance_to_object(closet_ship) <= rope_length * 10) {
			connector.connect(closet_ship, object_index, rope_length);
			closet_ship.control = object_index;
			control = closet_ship;
			con_camera.follow = closet_ship;
			state = States.Idle;
		}
	} else {
		//physics_joint_delete(rope);
		connector.connect(noone);
		//rope = noone;
		control.control = noone;
		control = object_index;
		con_camera.follow = object_index;
	}
}