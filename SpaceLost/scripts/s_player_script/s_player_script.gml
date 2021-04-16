// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function s_player_script(){
	hInput = keyboard_check(vk_right) - keyboard_check(vk_left);
	vInput = keyboard_check(vk_down) - keyboard_check(vk_up);
	
	if (hInput != 0 || vInput != 0) {
		if (hInput != hInput_last || vInput != vInput_last) {
			dir = point_direction(x,y,x+hInput,y-vInput);
			if (dir == 0 && dir_last >= 180) dir = 360;
			t = 0;
		}
		show_debug_message("dir_last: " + string(dir_last) + " dir:" + string(dir) + " t:" + string(t));
		t += delta_time * 0.000001;
		
		//if (dir_last < dir) {
		//	a = dir;
		//	b = dir_last;
		//}
		//else {
		//	a = dir_last;
		//	b = dir;
		//}
		b = dir;
		a = dir_last;
		
		phy_rotation = lerp(a, b, min(t, 1));
		physics_apply_local_force(0, 0, mSpeed, 0);
		
		dir_last = phy_rotation;
		if (dir_last == 360) {
			dir = 0;
		}
	}
	hInput_last = hInput;
	vInput_last = vInput;
}