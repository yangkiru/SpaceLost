if !control return;

hInput = keyboard_check(vk_right) - keyboard_check(vk_left); // left right arrows
vInput = keyboard_check(vk_down) - keyboard_check(vk_up); // up down arrows
bInput = keyboard_check(vk_lshift);
	
if (hInput != 0 || vInput != 0) { // if got key
		
	var pd = point_direction(x,y,x+hInput,y-vInput); // get direction
	var dd = angle_difference(phy_rotation, pd);
	phy_rotation -= min(abs(dd), tSpd * tSpd_const) * sign(dd);
	phy_angular_velocity = 0;
	//phy_position_x += hInput * (vInput != 0 ? 0.5 : 1) * (bInput ? 5 : 1);
	//phy_position_y += vInput * (hInput != 0 ? 0.5 : 1) * (bInput ? 5 : 1);
	physics_apply_local_force(0, 0, mSpd * mSpd_const * (bInput ? 5 : 1), 0); // move foward
}// else if (hInput == hInput_last && vInput == vInput_last) physics_fixture_set_angular_damping(self, 0.1);
hInput_last = hInput;
vInput_last = vInput;