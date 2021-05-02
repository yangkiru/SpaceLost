/// @description Connect

if (rope == -1 && distance_to_object(ship) <= rope_length * 10) {
	rope = instance_create(ship.x, ship.y, obj_rope_create);
	rope.image_xscale = rope_length;
	rope.anchor_1 = self;
	rope.anchor_2 = ship;
	rope.init = true;
	
	ship.control = true;
	control = false;
	
	con_camera.follow = ship;
} else if (rope != -1) {
	instance_destroy(rope);
	rope = -1;
	
	ship.control = false;
	control = true;
	con_camera.follow = self;
}