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

function switch_overdrive() {
	if (parent.hInput != 0 || parent.vInput != 0) {
		if (sprite_index == spr_original) {
			if (parent.bInput) {
				if (image_alpha > 0) {
					image_alpha = max(0, image_alpha - spd);
				} else {
					sprite_index = spr_boost;
				}
			} else {
				image_alpha = min(1, image_alpha + spd);
			}
		} else { // On boost
			if (parent.bInput) {
				image_alpha = min(1, image_alpha + spd);
			} else {
				image_alpha = max(0, image_alpha - spd);
				if (image_alpha <= 0)
					sprite_index = spr_original;
			}
		}	
	} else
	image_alpha = max(0, image_alpha - spd);

	image_yscale = 0.5 + image_alpha * 0.5;
}

function shoot_dust(dust) {
		var offsetX = random_range(-dust_rangeX, dust_rangeX);
		var offsetY = random_range(-dust_rangeY, dust_rangeY);
		var _c = dcos(parent.image_angle);
		var _s = dsin(parent.image_angle);
		dust.sprite_index = parent.bInput ? spr_gray_dust : spr_white_dust;
		dust.x = x + _c * offsetX + _s * offsetY;
		dust.y = y + _c * offsetY - _s * offsetX;
		dust.direction = point_direction(parent.x, parent.y, x, y);
		dust.speed = 5;
		dust.spd = parent.bInput ? 0.015 : 0.01;
		dust.init = true;
}