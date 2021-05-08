/// @description Insert description here
// You can write your code in this editor

connected = noone;
joint = noone;
offset = -68;

function connect(target) {
	connected = target;
	if (target != noone) {
		phy_position_x = target.phy_position_x;
		phy_position_y = target.phy_position_y;
	
		joint = physics_joint_weld_create(self, target, phy_position_x, phy_position_y + offset, 0, 1, 1, 0);
	} else {
		physics_joint_delete(joint);
		joint = noone;
	}
}