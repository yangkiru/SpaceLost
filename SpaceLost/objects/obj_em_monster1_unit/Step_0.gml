//if (control == self) {
//	switch (state) {
//		case States.Idle : 
//			if (control == self) { // Ride on Ship
//				var closet_ship = instance_nth_nearest(x, y, con_ship, 1);
//				if (closet_ship.control == noone && distance_to_object(closet_ship) <= rope_length * 10) {
//					connector.connect(closet_ship);
//					rope = physics_joint_rope_create(connector, self, connector.phy_position_x, connector.phy_position_y, phy_position_x, phy_position_y, rope_length * 16, 0);
//					closet_ship.control = self;
//					control = closet_ship;
//				}
//			} else {
//				//physics_joint_delete(rope);
//				//connector.connect(noone);
//				//rope = noone;
//				//control.control = noone;
//				//control = self;
//			} break;
//	}
//}