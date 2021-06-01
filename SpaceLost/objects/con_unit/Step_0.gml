//instance_nth_nearest(x, y, con_ship, 1);

// Closet Ship
if (control == self) {
	closet_ship = instance_empty_ship_nearest(x, y, con_ship, 1);
	if (closet_ship != noone)
		closet_ship_dist = get_distance(closet_ship, self, true);
}
// Inputs
if (owner.object_index == obj_player_unit) {
	hInput = keyboard_check(vk_right) - keyboard_check(vk_left); // left right arrows
	vInput = keyboard_check(vk_down) - keyboard_check(vk_up); // up down arrows
	lInput = keyboard_check_released(ord("F"));
} else if (parent == con_em_unit && control == self && closet_ship != noone) {
	enemy_input();
} else if (parent == con_em_unit && control == self) {
	var target = obj_player_unit;
	var pd = point_direction(target.x, target.y, x, y);
	hInput = lengthdir_x(1, pd);
	vInput = lengthdir_y(1, pd);
	
	lInput = 0;
	state = States.Turning;
	enemy_movement();
}

// Inits
isKey = hInput != 0 || vInput != 0;
image_speed = 1;

// State Machine
if (control == self) {
	switch (state) {
		case States.Idle :
			target_spr(grab ? spr_idle_grab : spr_idle);
			if (isKey)
				state = States.MoveStart;
			break;
		case States.MoveStart : 	
			target_spr(grab ? spr_swim_grab : spr_swim);
			state = States.Moving;
			break;
		case States.Moving :
			if (object_index == obj_player_unit) { // Player unit
				if (!isKey) { // if didn't get key		
					var isEndOfFrame = image_index > (image_number -1);
			
					if (isEndOfFrame) {
						target_spr(grab ? spr_idle_grab : spr_idle);
						state = States.Idle;
					}
				} else {
					state = States.Turning;
				}
			} else if (parent == con_em_unit) { // Enemy
				enemy_movement();
			}
			break;
		case States.Turning :
			if (isKey) {
				if (parent == con_em_unit) show_debug_message("enemey turn");
				var pd = point_direction(phy_position_x,phy_position_y,phy_position_x+hInput,phy_position_y-vInput) + 90; // get direction
				var dd = angle_difference(phy_rotation, pd);
				phy_rotation -= min(abs(dd), tSpd * tSpd_const) * sign(dd);
				phy_angular_velocity = 0;
				if (abs(dd) < 1) state = States.Moving;
			} else {
				state = States.Moving;
			}
			break;
	}
} else {
	show_debug_message(object_get_name(control.object_index));
	switch (state) {
		case States.MoveStart :
			target_spr(grab ? spr_swim_grab : spr_swim);
			state = States.Moving;
			break;
		case States.Moving : 
			if collision_circle(phy_position_x, phy_position_y, 10, move_target, false, true){
				state = States.MoveStop;
			}
			break;
		case States.MoveStop : 
			if (t == 0) {
				last_spd_x = phy_speed_x;
				last_spd_y = phy_speed_y;
			}
			t += 1 / room_speed;
			phy_speed_x = lerp(last_spd_x, 0, min(1,t));
			phy_speed_y = lerp(last_spd_y, 0, min(1,t));
			if (t > 1) {
				t = 0;
				state = States.Idle;
			}
			
			break;
		case States.Idle : 
			if (phy_speed > 5) {
				target_spr(spr_fly);
				image_speed = phy_speed * 0.05;
			} else {
				target_spr(grab ? spr_idle_grab : spr_idle);
			}
			break;
		}
}

// Connect
if (lInput) {
	connect_rope();
}
// Oxygen
if (control.parent != con_ship)
	oxygen = max(0, oxygen - oxygen_usage / room_speed);
else
	oxygen = oxygen_max;