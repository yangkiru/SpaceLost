function attach_to_object(offsetX, offsetY, parent){
	var _c = dcos(parent.image_angle);
	var _s = dsin(parent.image_angle);
	x = parent.x + _c * offsetX + _s * offsetY;
	y = parent.y + _c * offsetY - _s * offsetX;

	image_angle = parent.image_angle;
}