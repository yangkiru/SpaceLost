/// @description Create Rope
if (init) {

	l = ds_list_create();
	length = image_xscale;
	xx = 16;
	// Create initial segments
	obj1 = instance_create_depth(x, y, 0, obj_rope);
	obj2 = instance_create_depth(x + xx, y, 0, obj_rope);

	physics_joint_revolute_create(obj1, obj2, obj2.x, obj2.y, -1, 1, 0, 0, 0, 0, 0);


	ds_list_add(l, obj1);
	ds_list_add(l, obj2);
	// Make sure to give first segment a parent (used for drawing)
	obj1.parent = obj2;
	obj2.parent = obj1;

	// Loop through rest of bridge

	var i;
	for (i = 0; i < length - 2; ++i) {
		xx += 16;
		// Move to next segment
		obj1 = obj2;
		obj2 = instance_create_depth(x + xx, y, 0, obj_rope);
		physics_joint_revolute_create(obj1, obj2, obj2.x, obj2.y, -1, 1, 0, 0 , 0, 0, 0);

		ds_list_add(l, obj2);
		obj2.parent = obj1;
	}
	// End segment
	xx += 16;

	obj1 = obj2;
	obj2 = instance_create_depth(x + xx, y, 0, obj_rope);
	physics_joint_revolute_create(obj1, obj2, obj2.x, obj2.y, -1, 1, 0, 0, 0, 0, 0);
	
	ds_list_add(l, obj2);
	obj2.parent = obj1;
	
	init = false;
}

// Connect

if (!connected && anchor_1 != -1 && anchor_2 != -1) {

	head = l[| 0];
	tail = l[| ds_list_size(l)-1];

	head.phy_position_x = anchor_1.phy_position_x;
	head.phy_position_y = anchor_1.phy_position_y;
	
	// j_h, j_t use for cut the rope
	j_h = physics_joint_revolute_create(anchor_1, head, head.phy_position_x, head.phy_position_y, -1, 1, 0, 0 , 0, 0, 0);

	tail.phy_position_x = anchor_2.phy_position_x - 16;
	tail.phy_position_y = anchor_2.phy_position_y;

	j_t = physics_joint_revolute_create(anchor_2, tail, tail.phy_position_x + 16 , tail.phy_position_y, -1, 1, 0, 0 , 0, 0, 0);

	anchor_1.rope_ready = true;
	anchor_2.rope_ready = true;

	connected = true;
}
