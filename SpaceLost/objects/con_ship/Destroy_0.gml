if (weapon != noone)
	instance_destroy(weapon);
if (bst != noone) {
	for(var i=0;i<ds_list_size(bst);i++) {
		instance_destroy(bst[| i]);
	}
	ds_list_destroy(bst);
}
if (owner != noone) {
	owner.rope = noone;
}