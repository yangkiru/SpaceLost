event_inherited();

if (parent.force_dir > 1)
	switch_overdrive();
else
	image_alpha = max(0, image_alpha - spd);

image_yscale = 0.5 + image_alpha * 0.5;