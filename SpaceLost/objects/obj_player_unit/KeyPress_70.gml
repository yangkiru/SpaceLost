/// @description Connect

if (rope == -1 && distance_to_object(ship) <= rope_length * 10) {
	rope = physics_joint_rope_create(ship.connector, self, ship.connector.phy_position_x, ship.connector.phy_position_y, phy_position_x, phy_position_y, rope_length * 16, 0);
	ship.control = true;
	control = false;
	
	con_camera.follow = ship;
	state = States.Idle;
} else if (rope != -1) {
	physics_joint_delete(rope);
	rope = -1;
	
	ship.control = false;
	control = true;
	con_camera.follow = self;
}