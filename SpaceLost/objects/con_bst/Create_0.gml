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