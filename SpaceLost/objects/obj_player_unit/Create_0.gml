// @description Insert description here
anchor = obj_player_ship;
rope_length = global.data[? "player"][? "rope_length"];
show_debug_message(rope_length);
rope_length = real(rope_length);
rope_ready = false;

physics_set_density(self, global.data[? "player"][? "density"]);

//head = ds_queue_head(rope.q);
//head.phy_position_x = anchor.x;
//head.phy_position_y = anchor.y;

//physics_joint_revolute_create(anchor,head,anchor.x,anchor.y,-1, 1, 1, 0 , 0, 0, 0);

//phy_position_x = tail.phy_position_x;
//phy_position_y = tail.phy_position_y;

//physics_joint_revolute_create(anchor,tail,anchor.x,anchor.y,0,0,0,0,0,0,0);
