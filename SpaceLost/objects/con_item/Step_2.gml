if (owner != noone) {
	phy_position_x = lerp(x, owner.x, 0.1);
	phy_position_y = lerp(y, owner.y, 0.1);
	
	var obj_parent = object_get_parent(owner.object_index);
	if (obj_parent == con_ship) {
		var dist = get_distance(owner, self, false)
		if (dist < 100) {
			ds_list_add(obj_parent.inventory.list, self);
			layer = layer_get_id("Inventories");
		}
	}
}