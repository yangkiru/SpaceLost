function shoot_dust(dust) {
		var offsetX = random_range(-dust_rangeX, dust_rangeX);
		var offsetY = random_range(-dust_rangeY, dust_rangeY);
		var _c = dcos(parent.image_angle);
		var _s = dsin(parent.image_angle);
		dust.x = x + _c * offsetX + _s * offsetY;
		dust.y = y + _c * offsetY - _s * offsetX;
		dust.direction = point_direction(parent.x, parent.y, x, y);
		dust.speed = 5;
		dust.init = true;
}

repeat(2) {
	if ds_stack_empty(obj_white_dust_pool.pool) {
	    var dust = instance_create(x,y, obj_white_dust);
		shoot_dust(dust);
	}
	else {
		var dust = ds_stack_pop(obj_white_dust_pool.pool);
		
		shoot_dust(dust);
		instance_activate_object(dust);
	}
}

