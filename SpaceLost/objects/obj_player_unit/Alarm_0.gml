///@description Connect
instance_destroy(ds_queue_dequeue(rope.q));
head = ds_queue_head(rope.q);
head.parent = -1;

var t = ds_queue_tail(rope.q).parent;
instance_destroy(ds_queue_tail(rope.q));
tail = t;
xx = anchor.phy_position_x;
yy = anchor.phy_position_y;
rr = anchor.phy_rotation;

anchor.phy_position_x = head.phy_position_x;
anchor.phy_position_y = head.phy_position_y;
anchor.phy_rotation = 0;

//head.phy_position_x = anchor.phy_position_x;
//head.phy_position_y = anchor.phy_position_y;
physics_joint_revolute_create(anchor, head, anchor.phy_position_x, anchor.phy_position_y, -30, 30, 1, 0 , 0, 0, 0);

anchor.phy_position_x = xx;
anchor.phy_position_y = yy;
anchor.phy_rotation = rr;

xx = phy_position_x;
yy = phy_position_y;
rr = phy_rotation;

tail.phy_position_x = phy_position_x - tail.sprite_width * 0.5;
tail.phy_position_y = phy_position_y;



physics_joint_revolute_create(self, tail, phy_position_x, phy_position_y, -30, 30, 1, 0 , 0, 0, 0);
rope_ready = true;