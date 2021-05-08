if control {

	hInput = keyboard_check(vk_right) - keyboard_check(vk_left); // left right arrows
	vInput = keyboard_check(vk_up) - keyboard_check(vk_down); // up down arrows
	bInput = keyboard_check(vk_lshift);
	
	if (hInput != 0 || vInput != 0) { // if got key
		
		//var pd = point_direction(x,y,x+hInput,y+vInput) + 90; // get direction
		var pd = point_direction(phy_position_x,phy_position_y,phy_position_x+hInput,phy_position_y+vInput) + 90; // get direction
		var dd = angle_difference(phy_rotation, pd);
		phy_rotation -= min(abs(dd), tSpd * tSpd_const * (bInput ? btSpd : 1)) * sign(dd);
		force_dir = dd;
		phy_angular_velocity = 0;
		physics_apply_local_force(0, 0, 0, -mSpd * mSpd_const * (bInput ? bmSpd : 1)); // move foward
		if (bInput && !(con_camera.shake) && con_camera.shakeForce == 0) { // Shake
			show_debug_message("first shake");
			con_camera.shake = true;
			con_camera.shakeForce = 10;
			con_camera.shakeDur = 20;
		} else if (bInput && con_camera.shakeDur <= 1) {
			show_debug_message("other shake");
			con_camera.shake = true;
			con_camera.shakeForce = 3;
			con_camera.shakeDur = 5;
		}
	} else force_dir = 0;
	hInput_last = hInput;
	vInput_last = vInput;
} else {
	hInput = 0;
	vInput = 0;
	bInput = 0;
}

