if control { // Player not connected

	hInput = keyboard_check(vk_right) - keyboard_check(vk_left); // left right arrows
	vInput = keyboard_check(vk_down) - keyboard_check(vk_up); // up down arrows
	bInput = keyboard_check(vk_lshift);
	
	phy_linear_damping = 0.5;

	if (hInput != 0 || vInput != 0) { // if got key
		if !grab && sprite_index != spr_player_swim { // swim
			sprite_index = spr_player_swim;
			image_index = 0;
		}
		else if grab && sprite_index != spr_player_swim_grab { // swim with grab
			sprite_index = spr_player_swim_grab;
			image_index = 0;
		}
	}
	else if image_index > (image_number -1) { // end of sprite frame
			if !grab && sprite_index != spr_player_idle // idle
				sprite_index = spr_player_idle;
			else if grab && sprite_index != spr_player_idle_grab // idle with grab
				sprite_index = spr_player_idle_grab;
			image_index = 0;
	}
}
else { // Player connected
	if move_target < 0 { // lost target
		
		if !grab && sprite_index != spr_player_idle { // idle
			sprite_index = spr_player_idle;
			image_index = 0;
		} else if grab && sprite_index != spr_player_idle_grab { // idle with grab
			sprite_index = spr_player_idle_grab;
			image_index = 0;
		}
		if move_target == -2 {
			phy_linear_damping = 3;
			
			var pd = point_direction(phy_position_x,phy_position_y,target_x,target_y);
			var lx = lengthdir_x(1, pd);
			var ly = lengthdir_y(1, pd);
			var spd = mSpd * mSpd_const;
			physics_apply_force(phy_position_x, phy_position_y, spd * lx, spd * ly);
			
			if point_distance(phy_position_x,phy_position_y,target_x,target_y) < 0.5 {
				move_target = -1;
				phy_speed_x = 0;
				phy_speed_y = 0;
			}
		} else
			phy_linear_damping = 0.5;
		return;
	}
	phy_linear_damping = 0.5;
		
	if !grab && sprite_index != spr_player_swim { // swim
		sprite_index = spr_player_swim;
		image_index = 0;
	}
	else if grab && sprite_index != spr_player_swim_grab { // swim with grab
		sprite_index = spr_player_swim_grab;
		image_index = 0;
	}		

	if instance_position(target_x, target_y, self) { // reach at point
		move_target = -2; // target lost
		return;
	}
}