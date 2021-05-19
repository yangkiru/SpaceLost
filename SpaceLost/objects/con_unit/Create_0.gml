// unit_data = global.data[? "unit_name"];
rope_length = real(unit_data[? "rope_length"]);
mSpd = real(unit_data[? "mSpd"]);
mSpd_const = real(unit_data[? "mSpd_const"]);
tSpd = real(unit_data[? "tSpd"]);
tSpd_const = real(unit_data[? "tSpd_const"]);
rope_rot_spd = real(unit_data[? "rope_rot_spd"]);
rope_circle_alpha = real(unit_data[? "rope_circle_alpha"]);
hp_max = real(unit_data[? "hp_max"]);
hp = hp_max;

rope = noone;
rope_rot = 0;
connector = noone;

move_target = noone;
grab = -1;

hInput = 0;
vInput = 0;
lInput = 0;

control = object_index; // This object control it
owner = object_index; // Who control this
parent = object_get_parent(object_index);
camera_zoom = 1;
closet_ship = noone;

t = 0;
t_rope = 0;

state = States.Idle;

spr_swim = noone;
spr_swim_grab = noone;
spr_idle = noone;
spr_idle_grab = noone;
spr_fly = noone;

depth = ObjectDepth.Unit;

c = make_color_rgb(238,23,93);

function damage(value) {
	hp -= value;
	
	if (hp <= 0) { // Destroy
		destroy();
	} else show_debug_message(object_get_name(object_index) + " got " + string(value) + " damage!");
}

function destroy() {
	show_debug_message("destroy");
	if (control != noone)
		control.owner = noone;
	instance_destroy(self);
}

function target_spr(spr) {
	if (sprite_index != spr && spr != noone) {
		sprite_index = spr;
		image_index = 0;
	}
}

function connect_rope() {
	show_debug_message("rope");
	if (control == object_index) {
		if (closet_ship_dist <= rope_length * 3) {
			t_rope = 0;
			if (connector != noone)
				rope = connector.connect(closet_ship, object_index, rope_length * 3);
			else {
				rope = physics_joint_rope_create(self, closet_ship, phy_position_x, phy_position_y, closet_ship.phy_position_x, closet_ship.phy_position_y, rope_length * 3, 0);
			}
			closet_ship.owner = object_index;
			control = closet_ship;
			if (owner == obj_player_unit)
				con_camera.follow = closet_ship;
			state = States.Idle;
			lInput = 0;
			return closet_ship;
		} else return noone;
	} else {
		//physics_joint_delete(rope);
		if (connector != noone)
			rope = connector.connect(noone);
		else physics_joint_delete(rope);
		//rope = noone;
		control.owner = noone;
		control = object_index;
		if (owner == obj_player_unit)
			con_camera.follow = object_index;
		lInput = 0;
	}
}

function movement() {
	if control == object_index { // Control player
		var sum = abs(hInput) + abs(vInput);
		var spd = mSpd * mSpd_const;
		if sum != 0
		physics_apply_impulse(phy_position_x, phy_position_y, spd * hInput / sum, spd * vInput / sum);
	} else { // Contorl ship
		if (move_target == noone) {
			state = States.MoveStop;
			return;
		}
		var pd = point_direction(phy_position_x,phy_position_y,move_target.x,move_target.y);
		var spd = mSpd * mSpd_const;
		var lx = lengthdir_x(1, pd);
		var ly = lengthdir_y(1, pd);
		var sum = abs(lx) + abs(ly);
					
		physics_apply_impulse(phy_position_x,phy_position_y,spd * lx / sum, spd * ly / sum);
	}
}

function enemy_input() {}

function enemy_movement() {}

enum States {
	Idle, MoveStart, Moving, MoveStop, Turning, Chasing, Running
}