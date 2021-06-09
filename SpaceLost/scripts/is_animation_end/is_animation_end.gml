// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function is_animation_end(){
	return (image_index >= image_number - (image_speed * sprite_get_speed(sprite_index) / game_get_speed(gamespeed_fps)) && image_index < image_number);
}