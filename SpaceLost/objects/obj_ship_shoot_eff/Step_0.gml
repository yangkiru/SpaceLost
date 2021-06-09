if (is_animation_end())
	obj_ship_shoot_eff_pool.deactivate_obj(self);
	
if (parent != noone && instance_exists(parent)) {
	x = lerp(x, parent.x, 0.003 * parent.owner.phy_speed);
	y = lerp(y, parent.y, 0.003 * parent.owner.phy_speed);
}