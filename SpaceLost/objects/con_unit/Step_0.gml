//Inputs
if (owner == obj_player_unit) {
	hInput = keyboard_check(vk_right) - keyboard_check(vk_left); // left right arrows
	vInput = keyboard_check(vk_down) - keyboard_check(vk_up); // up down arrows
	lInput = keyboard_check_released(ord("F"));
} else if (parent == con_em_unit) {
	switch (state) {
		case States.Idle : // First, Get ride on ship
			if (control == object_index) {
				lInput = 1;
			} else lInput = 0;
	}
} else {
	hInput = 0;
	vInput = 0;
	lInput = 0;
}

// Inits

// phy_linear_damping = 0.5;
var isKey = hInput != 0 || vInput != 0;

image_speed = image_speed == 0 ? image_speed : 1;

// State Machine
if (control == owner) {
	switch (state) {
		case States.Idle :
			if (isKey)
				state = States.MoveStart;
			break;
		case States.MoveStart : 	
				target_spr(grab ? spr_swim_grab : spr_swim);
				state = States.Moving;
			break;
		case States.Moving :
			if (!isKey) { // if didn't get key		
				var isEndOfFrame = image_index > (image_number -1);
			
				if (isEndOfFrame) {
					target_spr(grab ? spr_idle_grab : spr_idle);
					state = States.Idle;
				}
			} else {
				state = States.Turning;
			}
			break;
		case States.Turning :
			if (isKey) {
				var pd = point_direction(phy_position_x,phy_position_y,phy_position_x+hInput,phy_position_y-vInput) + 90; // get direction
				var dd = angle_difference(phy_rotation, pd);
				phy_rotation -= min(abs(dd), tSpd * tSpd_const) * sign(dd);
				phy_angular_velocity = 0;
				if (abs(dd) < 1) state = States.Moving;
			} else state = States.Moving;
			break;
	}
} else {
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
			t += delta_time / 1000000;
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