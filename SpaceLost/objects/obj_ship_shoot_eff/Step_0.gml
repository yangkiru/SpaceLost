if (image_index >= image_number - (image_speed * sprite_get_speed(sprite_index) / game_get_speed(gamespeed_fps)) && image_index < image_number)
	obj_ship_shoot_eff_pool.deactivate_obj(self);
	
if (parent != noone && instance_exists(parent)) {
	x = parent.x;
	y = parent.y;
	image_angle = parent.image_angle;
}