if (parent == -1) return;

var _c = dcos(parent.image_angle);
var _s = dsin(parent.image_angle);
x = parent.x + _c * offsetX + _s * offsetY;
y = parent.y + _c * offsetY - _s * offsetX;

image_angle = parent.image_angle;

if (is_shoot_dust && image_alpha > 0.8 && alarm[0] <= 0) {
	alarm[0] = irandom_range(3,6);
}

// Copy and Edit this

//if (parent.hInput != 0 || parent.vInput != 0)
//	image_alpha = min(parent.bInput ? 0.9 : 1, image_alpha + spd);
//else
//	image_alpha = max(0, image_alpha - spd);
	
//if (parent.bInput) sprite_index = spr_boost;
//else sprite_index = spr_original;

//image_yscale = 0.5 + image_alpha * 0.5;