/// @description Connect

if (control == self) {
	var closet_ship = instance_nth_nearest(x, y, con_ship, 1);
	if (distance_to_object(closet_ship) <= rope_length * 10) {
		connector.connect(closet_ship);
		rope = physics_joint_rope_create(connector, self, connector.phy_position_x, connector.phy_position_y, phy_position_x, phy_position_y, rope_length * 16, 0);
		closet_ship.control = self;
		control = closet_ship;
		con_camera.follow = closet_ship;
		state = States.Idle;
	}
} else {
	physics_joint_delete(rope);
	connector.connect(noone);
	rope = noone;
	control.control = noone;
	control = self;
	con_camera.follow = self;
}