// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function s_player_script(){
	hInput = keyboard_check(vk_right) - keyboard_check(vk_left);
	vInput = keyboard_check(vk_down) - keyboard_check(vk_up);
	
	physics_apply_force(x, y, hInput * mSpeed, vInput * mSpeed);
}