
//function create_rope_holder(host, length, next_obj){
//	offset_y = 0;
//	next_rope = instance_create(x, y + offset_y, o_rope);

//	attach = physics_joint_friction_create(host, next_rope, host.x, host.y, next_rope.x, next_rope.y, 0, false);

//	with(next_rope){
//	    parent = other.id;
//	}

//	repeat (length){

//	    offset_y += 1;
//	    last_rope = next_rope;
//	    next_rope = instance_create(x, y + offset_y, o_rope);
    
//	    link = physics_joint_friction_create(last_rope, next_rope, last_rope.x, last_rope.y, next_rope.x, next_rope.y, 0, false);
//	    physics_joint_set_value(link, phy_joint_damping_ratio, 1);
//		physics_joint_set_value(link, phy_joint_max_length, 1);
//	    physics_joint_set_value(link, phy_joint_frequency, 1);
    
//	    with(next_rope){
//	        parent = other.last_rope;
//	    }

//	}

//	if (next_obj != noone) {
//		link = physics_joint_friction_create(next_rope, next_obj, next_rope.x, next_rope.y, next_obj.x, next_obj.y, 0, false);
//	    physics_joint_set_value(link, phy_joint_damping_ratio, 1);
//		physics_joint_set_value(link, phy_joint_max_length, 0);
//	    physics_joint_set_value(link, phy_joint_frequency, 1);	
//	}
//}