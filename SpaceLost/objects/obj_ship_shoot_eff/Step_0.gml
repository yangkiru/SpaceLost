if (image_index >= image_number - (image_speed * sprite_get_speed(sprite_index) / game_get_speed(gamespeed_fps)) && image_index < image_number)
	obj_ship_shoot_eff_pool.deactivate_obj(self);
	
if (parent != noone && instance_exists(parent)) {
	x = lerp(x, parent.x, 0.003 * parent.owner.phy_speed);
	y = lerp(y, parent.y, 0.003 * parent.owner.phy_speed);
}