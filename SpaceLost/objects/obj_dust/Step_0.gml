if (init) {
	//white 0.1 ~ 0.3 gray 0.2 ~ 0.5
	size = sprite_index == spr_white_dust ? random_range(0.1, 0.3) : random_range(0.3, 0.6);
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
	obj_dust_pool.deactivate_dust(self);
}