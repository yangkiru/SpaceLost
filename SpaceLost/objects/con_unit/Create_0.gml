// unit_data = global.data[? "unit_name"];
#region Sheet Variables
rope_length = real(unit_data[? "rope_length"]);
mSpd = real(unit_data[? "mSpd"]);
mSpd_const = real(unit_data[? "mSpd_const"]);
if (object_get_parent(object_index) == con_em_unit) 
	mSpd_run = real(unit_data[? "mSpd_run"]);
tSpd = real(unit_data[? "tSpd"]);
tSpd_const = real(unit_data[? "tSpd_const"]);
rope_rot_spd = real(unit_data[? "rope_rot_spd"]);
rope_circle_alpha = real(unit_data[? "rope_circle_alpha"]);
hp_max = real(unit_data[? "hp_max"]);
oxygen_max = real(unit_data[? "oxygen_max"]);
oxygen_usage = real(unit_data[? "oxygen_usage"]);
const_kb = real(unit_data[? "const_kb"]);
#endregion
#region Variables
hp = hp_max;
oxygen = oxygen_max;
mSpd_multi = 1;

// Rope
rope = noone;
rope_rot = 0;
connector = noone;

// Inputs
hInput = 0;
vInput = 0;
lInput = 0;

// Times
t = 0;
t_rope = 0;

// Sprites
spr_swim = noone;
spr_swim_grab = noone;
spr_idle = noone;
spr_idle_grab = noone;
spr_fly = noone;

// On Destroy
on_destroy = noone;
on_destroy_var = ds_map_create();

// Other
control = self; // This object control it
owner = self; // Who control this
parent = object_get_parent(object_index);
camera_zoom = 1;
closet_ship = noone;
depth = ObjectDepth.Unit;
c = make_color_rgb(238,23,93);
state = States.Idle;
move_target = noone;
grab = -1;

hit_color_create();

#endregion
#region Functions
function damage(value, attacker) {
	hp -= value;
	hit_color_damage();
	if (hp <= 0) { // Destroy
		destroy(attacker);
	} else show_debug_message(object_get_name(object_index) + " got " + string(value) + " damage!");
}

function destroy(attacker) {
	show_debug_message("destroy");
	if (control != noone)
		control.owner = noone;
	ds_map_add(on_destroy_var, "attacker", attacker);
	if (on_destroy != noone)
		script_execute(on_destroy, on_destroy_var);
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
	if (control == self) {
		if (closet_ship_dist <= rope_length * 3) {
			t_rope = 0;
			if (connector != noone)
				rope = connector.connect(closet_ship, self, rope_length * 3);
			else {
				rope = physics_joint_rope_create(self, closet_ship, phy_position_x, phy_position_y, closet_ship.phy_position_x, closet_ship.phy_position_y, rope_length * 3, 0);
			}
			closet_ship.owner = self;
			control = closet_ship;
			if (owner.object_index == obj_player_unit)
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
		control = self;
		if (owner.object_index == obj_player_unit)
			con_camera.follow = self;
		lInput = 0;
	}
}

function move() {
	
}

function movement() {
	if control == self { // Control player
		var sum = abs(hInput) + abs(vInput);
		var spd = mSpd * mSpd_const * mSpd_multi;
		if sum != 0
		physics_apply_impulse(phy_position_x, phy_position_y, spd * hInput / sum, spd * vInput / sum);
	}
	//else { // Contorl ship
	//	if (move_target == noone || !instance_exists(move_target)) {
	//		state = States.MoveStop;
	//		return;
	//	}
	//	var pd = point_direction(phy_position_x,phy_position_y,move_target.x,move_target.y);
	//	var spd = mSpd * mSpd_const;
	//	var lx = lengthdir_x(1, pd);
	//	var ly = lengthdir_y(1, pd);
	//	var sum = abs(lx) + abs(ly);
					
	//	physics_apply_impulse(phy_position_x,phy_position_y,spd * lx / sum, spd * ly / sum);
	//}
}

function turn() {
	var pd = point_direction(phy_position_x,phy_position_y,phy_position_x+hInput,phy_position_y-vInput) + 90; // get direction
	var dd = angle_difference(phy_rotation, pd);
	phy_rotation -= min(abs(dd), tSpd * tSpd_const) * sign(dd);
	phy_angular_velocity = 0;
}

function player_input() {
	hInput = keyboard_check(vk_right) - keyboard_check(vk_left); // left right arrows
	vInput = keyboard_check(vk_down) - keyboard_check(vk_up); // up down arrows
	lInput = keyboard_check_released(ord("F"));
}

function enemy_input() {
	if (closet_ship != noone) {
		ride_input();
	} else {
		run_input();
	}
	
}

function ride_input() {
	closet_ship = instance_empty_ship_nearest(x, y, con_ship, 1);
	
	if (closet_ship != noone) {
		closet_ship_dist = get_distance(closet_ship, self, true);
		if (closet_ship_dist > rope_length) {
			move_target = closet_ship;
						
			var dir = point_direction(x, y, move_target.x, move_target.y);
			hInput = lengthdir_x(1, dir);
			vInput = lengthdir_y(1, dir);
		} else {
			lInput = 1;
		}
	}
	
	mSpd_multi = 1;
}

function run_input() {
		var target = obj_player_unit;
		var pd = point_direction(target.x, target.y, x, y);
		hInput = lengthdir_x(1, pd);
		vInput = lengthdir_y(1, pd);
		mSpd_multi = mSpd_run;
		lInput = 0;
}

function enemy_movement() {}

#endregion

enum States {
	Idle, MoveStart, Moving, MoveStop, Turning, Chasing, Running
}