if (is_animation_end())
	obj_ship_shoot_eff_pool.deactivate_obj(self);
	
if (parent != noone && instance_exists(parent)) {
	x = parent.x;
	y = parent.y;
	image_angle = parent.image_angle;
}