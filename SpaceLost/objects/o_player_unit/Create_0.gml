// @description Insert description here

anchor = o_player_ship;	//anchor
mSpeed = 10000;	//move speed
tSpeed = 10000;	//torque speed
rope_length = 500;

physics_joint_rope_create(self, anchor, x, y, anchor.x, anchor.y, rope_length, true);