
if ds_stack_empty(obj_white_dust_pool.pool) {
    var dust = instance_create(x,y, obj_white_dust);
	dust.x = x + random_range(-dust_sizeX, dust_sizeX);
	dust.y = y + random_range(-dust_sizeY, dust_sizeY);
	dust.init = true;
}
else {
	var dust = ds_stack_pop(obj_white_dust_pool.pool);
	instance_activate_object(dust);
	dust.x = x + random_range(-dust_sizeX, dust_sizeX);
	dust.y = y + random_range(-dust_sizeY, dust_sizeY);
	dust.init = true;
	//dust.direction = dust_dir + random_range(-20,20);
	//dust.speed = 1;
}