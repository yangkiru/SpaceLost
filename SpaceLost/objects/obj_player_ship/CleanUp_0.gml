for(var i=0;i<ds_list_size(bst);i++) {
	instance_destroy(bst[| i]);
}
ds_list_destroy(bst);