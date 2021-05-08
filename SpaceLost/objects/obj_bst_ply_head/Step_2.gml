/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (parent.bInput && (parent.hInput != 0 || parent.vInput != 0))
	image_alpha = min(1, image_alpha + spd);
else
	image_alpha = max(0, image_alpha - spd);

image_yscale = 0.5 + image_alpha * 0.5;