//Inputs

hInput = keyboard_check(vk_right) - keyboard_check(vk_left); // left right arrows
vInput = keyboard_check(vk_down) - keyboard_check(vk_up); // up down arrows

// Inits

// phy_linear_damping = 0.5;
var isKey = hInput != 0 || vInput != 0;

// State Machine
if (control) {
	switch (state) {
		case States.Idle :
			if (isKey)
				state = States.MoveStart;
			break;
		case States.MoveStart : 
			var targetSpr = grab ? spr_player_swim_grab : spr_player_swim;
		
			if (isKey){
				target_spr(targetSpr);
				state = States.Moving;
			}
			break;
		case States.Moving :
			if (!isKey) { // if didn't get key
				targetSpr = grab ? spr_player_idle_grab : spr_player_idle;
				
				var isEndOfFrame = image_index > (image_number -1);
			
				if (isEndOfFrame) {
					target_spr(targetSpr);
					state = States.Idle;
				}
			}
			break;
	}
} else {
	switch (state) {
		case States.MoveStart :
			var targetSpr = grab ? spr_player_swim_grab : spr_player_swim;
			target_spr(targetSpr);
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
			if (isKey) {
				var targetSpr = spr_player_fly;
				target_spr(targetSpr);
			} else {
				var targetSpr = grab ? spr_player_idle_grab : spr_player_idle;
				target_spr(targetSpr);
			}
			break;
		}
}

function target_spr(spr) {
	if (sprite_index != spr) {
		sprite_index = spr;
		image_index = 0;
	}
}