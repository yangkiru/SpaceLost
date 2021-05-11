// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function instance_nth_nearest(pointx, pointy, object, n){
	var list,nearest;

	    n = min(max(1,n),instance_number(object));
	    list = ds_priority_create();
	    nearest = noone;
	    with (object) ds_priority_add(list,id,get_distance(pointx,pointy, false));
	    repeat (n) nearest = ds_priority_delete_min(list);
	    ds_priority_destroy(list);
	    return nearest;
}

function instance_empty_ship_nearest(pointx, pointy, object, n){
	var list,nearest;

	    n = min(max(1,n),instance_number(object));
	    list = ds_priority_create();
	    nearest = noone;
	    with (object) {
			if (control == noone) {
				ds_priority_add(list,id,distance_to_point(pointx,pointy));
			}
		}
	    repeat (n) nearest = ds_priority_delete_min(list);
	    ds_priority_destroy(list);
	    return nearest;
}