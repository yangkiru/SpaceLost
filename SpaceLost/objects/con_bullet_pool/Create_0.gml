// obj def in variable definitions tab

function create_bullet() {
	return instance_create_layer(x, y, "Instances", obj);
}

function activate_bullet() {
	if ds_queue_empty(pool) {
	    var bullet = instance_create_layer(x,y, "Instances", obj);
	}
	else {
		var bullet = ds_queue_dequeue(pool);
		
		instance_activate_object(bullet);
	}
	bullet.phy_active = true;
	bullet.alarm[0] = 120;
	return bullet;
}

function deactivate_bullet(bullet) {
	bullet.phy_active = false;
	ds_queue_enqueue(pool, bullet);
	instance_deactivate_object(bullet);
}

// create

pool = ds_queue_create();

repeat(20) {
	deactivate_bullet(create_bullet());
}
