// unit_data = global.data[? "unit_name"];
rope_length = real(unit_data[? "rope_length"]);
mSpd = real(unit_data[? "mSpd"]);
mSpd_const = real(unit_data[? "mSpd_const"]);

rope = noone;
rope_rot = 0;
connector = noone;

move_target = noone;
target_x = -1;
target_y = -1;
grab = -1;

hInput = 0;
vInput = 0;
lInput = 0;

control = object_index; // This object control it
owner = object_index; // Who control this
parent = object_get_parent(object_index);
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
			if (connector != noone)
				connector.connect(closet_ship, object_index, rope_length);
			else {
				rope = physics_joint_rope_create(self, closet_ship, phy_position_x, phy_position_y, closet_ship.phy_position_x, closet_ship.phy_position_y, rope_length * 16, 0);
			}
			closet_ship.control = object_index;
			control = closet_ship;
			if (owner == obj_player_unit)
				con_camera.follow = closet_ship;
			state = States.Idle;
		}
	} else {
		//physics_joint_delete(rope);
		if (connector != noone)
			connector.connect(noone);
		else physics_joint_delete(rope);
		//rope = noone;
		control.control = noone;
		control = object_index;
		if (owner == obj_player_unit)
			con_camera.follow = object_index;
	}
}

function movement() {
	if control == object_index { // Control player
		var sum = abs(hInput) + abs(vInput);
		var spd = mSpd * mSpd_const;
		if sum != 0
		physics_apply_impulse(phy_position_x, phy_position_y, spd * hInput / sum, spd * vInput / sum);
	} else { // Contorl ship
		var pd = point_direction(phy_position_x,phy_position_y,target_x,target_y);
		var spd = mSpd * mSpd_const;
		var lx = lengthdir_x(1, pd);
		var ly = lengthdir_y(1, pd);
		var sum = abs(lx) + abs(ly);
					
		physics_apply_impulse(phy_position_x,phy_position_y,spd * lx / sum, spd * ly / sum);
	}
}