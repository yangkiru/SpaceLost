ship_data = global.data[? "basic_ship"];

bst_head = instance_create_layer(x, y-224,"Instances",obj_bst_ply_head);
bst_back = instance_create_layer(x+2, y+224,"Instances",obj_bst_ply_back);
bst_left = instance_create_layer(x-192, y+132,"Instances",obj_bst_ply_left);
bst_right = instance_create_layer(x+187, y+132,"Instances",obj_bst_ply_right);

bst = ds_list_create();
ds_list_add(bst, bst_head);
ds_list_add(bst, bst_back);
ds_list_add(bst, bst_left);
ds_list_add(bst, bst_right);

for(var i=0;i<ds_list_size(bst);i++) {
	bst[| i].parent = self;
	bst[| i].update_offset();
}
bst_head.depth = depth-1;

event_inherited();
