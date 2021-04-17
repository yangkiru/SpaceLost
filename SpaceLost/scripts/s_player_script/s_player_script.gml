// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function s_player_script(){
	hInput = keyboard_check(vk_right) - keyboard_check(vk_left); // left right arrows
	vInput = keyboard_check(vk_down) - keyboard_check(vk_up); // up down arrows
	
	if (hInput != 0 || vInput != 0) { // if got key
		
		var pd = point_direction(x,y,x+hInput,y-vInput); // get direction
		var dd = angle_difference(phy_rotation, pd);
		phy_rotation -= min(abs(dd), 10 * tSpd) * sign(dd);
		
		physics_apply_local_force(0, 0, mSpd, 0); // move foward
	}
	hInput_last = hInput;
	vInput_last = vInput;
	
}