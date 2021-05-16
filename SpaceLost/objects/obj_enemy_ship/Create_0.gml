ship_data = global.data[? "monster_ship_1"];

//bst_left = instance_create_layer(x, y,"Instances",obj_bst_em1_back);
//bst_right = instance_create_layer(x, y,"Instances",obj_bst_em1_back);
bst_back = instance_create_layer(x+1, y+138,"Instances",obj_bst_em1_back);
bst = ds_list_create();
ds_list_add(bst, bst_back);
//ds_list_add(bst, bst_left);
//ds_list_add(bst, bst_right);

for(var i=0;i<ds_list_size(bst);i++) {
	bst[| i].parent = self;
	bst[| i].update_offset();
}
//bst_back.depth = depth-1;

event_inherited();

weapon = instance_create_layer(x, y-256, "Instances", obj_weapon_cannon);

weapon.equip_weapon();