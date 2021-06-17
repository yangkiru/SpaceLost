//grab = false;
owner = noone;
//collision = noone;
depth = depth-2;

offsetX = 0;
offsetY = 0;

function init_offset(target) {
	offsetX = abs(target.x - x);
	offsetY = abs(target.y - y);
}