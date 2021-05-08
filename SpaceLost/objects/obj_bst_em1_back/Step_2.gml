event_inherited();

if (parent.hInput != 0 || parent.vInput != 0) {
	if (parent.bInput) {
		if (image_alpha < 3)
			image_alpha = min(3, image_alpha + spd);
	} else {
		if (image_alpha > 1) image_alpha = max(1, image_alpha - spd);
		else image_alpha = min(1, image_alpha + spd);
	}
} else
	image_alpha = max(0, image_alpha - spd);

image_yscale = 0.5 + image_alpha * 0.5;