if control {

	hInput = keyboard_check(vk_right) - keyboard_check(vk_left); // left right arrows
	vInput = keyboard_check(vk_down) - keyboard_check(vk_up); // up down arrows
	bInput = keyboard_check(vk_lshift);

	if (hInput != 0 || vInput != 0) { // if got key
		if !grab && sprite_index != spr_player_swim
			sprite_index = spr_player_swim;
		else if grab && sprite_index != spr_player_swim_grab
			sprite_index = spr_player_swim_grab;
			
		if round(image_index) == 7 {
			if move {
				var sum = abs(hInput) + abs(vInput);
				var spd = mSpd * mSpd_const;
				if sum != 0
					physics_apply_impulse(phy_position_x, phy_position_y, spd * hInput / sum, spd * vInput / sum);
				move = false;
			}
		} else if image_index > image_number - 1 
			move = true;
	}
	else if image_index > image_number -1
		if sprite_index != spr_player_idle
			sprite_index = spr_player_idle;
}
else {
	if move_target == -1
		return;

	if instance_position(target_x, target_y, self) {
		if sprite_index != spr_player_idle && grab == -1
			sprite_index = spr_player_idle;
		move_target = -1;
		return;
	}

	if sprite_index != spr_player_swim && grab == -1
		sprite_index = spr_player_swim;
	
	physics_apply_force(phy_position_x,phy_position_y,-phy_speed_x*725,-phy_speed_y*725); //this code can make the physics object stop moving
	physics_apply_force(phy_position_x,phy_position_y,lengthdir_x(mSpd * mSpd_const,point_direction(x,y,target_x,target_y)),lengthdir_y(mSpd * mSpd_const,point_direction(x,y,target_x,target_y)));
}