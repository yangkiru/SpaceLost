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

