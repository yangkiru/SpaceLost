/// @description Insert description here
// You can write your code in this editor

connected = noone;
head = noone;
tail = noone;
offsetX = 0;
offsetY = 44;

instance_deactivate_object(object_index);

function connect(h, t, rope_length) {
	if (h != noone) {
		
		phy_position_x = h.phy_position_x + offsetX;
		phy_position_y = h.phy_position_y + offsetY;
		phy_rotation = 0;

		connected = h;
		
		head = physics_joint_revolute_create(self, h, h.phy_position_x, h.phy_position_y, 0, 0, 0, 0, 0, 0, 0);
		tail = physics_joint_rope_create(self, t, phy_position_x, phy_position_y, t.phy_position_x, t.phy_position_y, rope_length * 16, 0);
		instance_activate_object(object_index);
	} else {
		physics_joint_delete(head);
		physics_joint_delete(tail);
		connected = noone;
		head = noone;
		tail = noone;
		instance_deactivate_object(object_index);
	}
}