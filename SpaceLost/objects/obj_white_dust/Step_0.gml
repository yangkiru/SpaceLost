if (init) {
	size = random_range(0.5, 0.7);
	image_xscale = size;
	image_yscale = size;
	image_alpha = 1;
	init = false;
}
image_xscale -= spd;
image_yscale -= spd;
image_alpha -= spd;

x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);

if (image_xscale <= 0) { 
	ds_stack_push(obj_white_dust_pool.pool, self);
	instance_deactivate_object(self);
}