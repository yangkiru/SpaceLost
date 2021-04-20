// @description Insert description here
anchor = obj_player_ship;
rope_length = global.data[? "player"][? "rope_length"];
show_debug_message(rope_length);
rope_length = real(rope_length);
//create_rope_holder(self, rope_length, anchor);

physics_set_density(self, global.data[? "player"][? "density"]);
//physics_joint_distance_create(self, anchor, x, y, anchor.x, anchor.y, rope_length);

rope = instance_create(x, y, con_rope_create);
head = ds_queue_dequeue(rope.q);//ds_queue_head(rope.q);
tail = ds_queue_tail(rope.q);

instance_destroy(head);

head = ds_queue_head(rope.q);
head.phy_position_x = x;
head.phy_position_y = y;

physics_joint_revolute_create(self,head,x,y,0,0,0,0,0,0,0);

//tail.phy_position_x = anchor.x;
//tail.phy_position_y = anchor.y;

//physics_joint_revolute_create(anchor,tail,x,y,0,0,0,0,0,0,0);