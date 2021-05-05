event_inherited();

if (parent.hInput != 0 || parent.vInput != 0)
	image_alpha = min(parent.bInput ? 0.9 : 1, image_alpha + spd);
else
	image_alpha = max(0, image_alpha - spd);
	
if (parent.bInput) sprite_index = spr_boost;
else sprite_index = spr_original;

image_yscale = 0.5 + image_alpha * 0.5;