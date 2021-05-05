event_inherited();

if (parent.force_dir > 1)
	image_alpha = min(1, image_alpha + spd);
else
	image_alpha = max(0, image_alpha - spd);