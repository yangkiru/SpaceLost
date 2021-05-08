pool = ds_stack_create();

repeat(20) {
	var dust = instance_create_layer(x, y, "Instances", obj_dust);
	ds_stack_push(pool, dust);
	instance_deactivate_object(dust);
}