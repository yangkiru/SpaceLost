/// @description Connect

if (rope == -1 && distance_to_object(ship) <= rope_length * 10) {
	rope = physics_joint_rope_create(ship.connector, self, ship.connector.phy_position_x, ship.connector.phy_position_y, phy_position_x, phy_position_y, rope_length * 16, 0);
	//
	rope = instance_create_depth(ship.x, ship.y, 0, obj_rope_create);
	rope.image_xscale = rope_length;
	rope.anchor_1 = self;
	rope.anchor_2 = ship.connector;
	rope.init = true;
	//
	ship.control = true;
	control = false;
	
	con_camera.follow = ship;
	state = States.Idle;
} else if (rope != -1) {
	//instance_destroy(rope);
	physics_joint_delete(rope);
	rope = -1;
	
	ship.control = false;
	control = true;
	con_camera.follow = self;
}