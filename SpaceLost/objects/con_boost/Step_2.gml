if (parent == -1) return;

var _c = dcos(parent.image_angle);
var _s = dsin(parent.image_angle);
x = parent.x + _c * offsetX + _s * offsetY;
y = parent.y + _c * offsetY - _s * offsetX;

image_angle = parent.image_angle;

if (parent.bInput)
	image_alpha = min(1, image_alpha + spd);
else
	image_alpha = max(0, image_alpha - spd);