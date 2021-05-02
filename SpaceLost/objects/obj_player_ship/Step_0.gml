if !control return;

hInput = keyboard_check(vk_right) - keyboard_check(vk_left); // left right arrows
vInput = keyboard_check(vk_up) - keyboard_check(vk_down); // up down arrows
bInput = keyboard_check(vk_lshift);
	
if (hInput != 0 || vInput != 0) { // if got key
		
	var pd = point_direction(x,y,x+hInput,y+vInput) + 90; // get direction
	
	var dd = angle_difference(phy_rotation, pd);
	phy_rotation -= min(abs(dd), tSpd * tSpd_const * (bInput ? btSpd : 1)) * sign(dd);
	phy_angular_velocity = 0;
	physics_apply_local_force(0, 0, 0, -mSpd * mSpd_const * (bInput ? bmSpd : 1)); // move foward
	
}
hInput_last = hInput;
vInput_last = vInput;