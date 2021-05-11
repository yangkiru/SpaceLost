function instance_nth_nearest(xx, yy, object, n){
	var list,nearest;

	    n = min(max(1,n),instance_number(object));
	    list = ds_priority_create();
	    nearest = noone;
	    with (object) ds_priority_add(list,id,get_distance_point(xx,yy, x, y, false));
	    repeat (n) nearest = ds_priority_delete_min(list);
	    ds_priority_destroy(list);
	    return nearest;
}

function instance_empty_ship_nearest(xx, yy, object, n){
	var list,nearest;

	    n = min(max(1,n),instance_number(object));
	    list = ds_priority_create();
	    nearest = noone;
	    with (object) {
			if (owner == noone) {
				ds_priority_add(list,id,get_distance_point(xx,yy, x, y, false));
			}
		}
	    repeat (n) nearest = ds_priority_delete_min(list);
	    ds_priority_destroy(list);
	    return nearest;
}