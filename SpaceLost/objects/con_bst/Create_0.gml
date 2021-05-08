parent = noone;

function update_offset() {
	offsetX = x - parent.x;
	offsetY = y - parent.y;
}

rot = 0;
spd = 0.1;
image_alpha = 0;

dust_rangeX = 10;
dust_rangeY = 10;
is_shoot_dust = true;