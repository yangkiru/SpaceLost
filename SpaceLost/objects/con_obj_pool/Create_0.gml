function create_obj(_obj) {
	return instance_create_layer(x, y, "Instances", _obj != noone ? _obj : obj);
}

function activate_obj() {
	if ds_queue_empty(pool) {
	    var _obj = create_obj();
	}
	else {
		var _obj = ds_queue_dequeue(pool);
		instance_activate_object(_obj);
	}
	if (variable_instance_exists(_obj, "phy_active"))
		_obj.phy_active = true;
	return _obj;
}

function deactivate_obj(_obj) {
	if (variable_instance_exists(_obj, "phy_active"))
		_obj.phy_active = false;
	ds_queue_enqueue(pool, _obj);
	instance_deactivate_object(_obj);
}

function init(_obj) {
	obj = _obj;
	pool = ds_queue_create();

	repeat(20) {
		deactivate_obj(create_obj(_obj));
	}
}
