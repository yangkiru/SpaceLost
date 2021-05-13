// obj def in variable definitions tab

function create_dust() {
	return instance_create_layer(x, y, "Instances", obj);
}

function activate_dust() {
	if ds_queue_empty(pool) {
	    var dust = instance_create_layer(x,y, "Instances", obj);
	}
	else {
		var dust = ds_queue_dequeue(pool);
		
		instance_activate_object(dust);
	}
	return dust;
}

function deactivate_dust(dust) {
	ds_queue_enqueue(pool, dust);
	instance_deactivate_object(dust);
}

// create

pool = ds_queue_create();

repeat(20) {
	deactivate_dust(create_dust());
}