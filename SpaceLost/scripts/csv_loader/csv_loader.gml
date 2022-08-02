// call function in room creation code
function csv_loader(directory){
	show_debug_message("csv_loader!!!!")
	var file_grid = load_csv(directory);
	var data = ds_map_create();
	var hh = ds_grid_height(file_grid);
	var m = noone;
	if (!ds_exists(file_grid, ds_type_grid)) {
		return noone;
	}


	for (var i = 1; i < hh; i++;)
	{
		var group = file_grid[# 1, i];
		if (group != "") { // new group
			m = ds_map_create();
			ds_map_add_map(data, group, m);
			show_debug_message(group)
		}
		var key = file_grid[# 2, i];
		if (key == "") continue;
		show_debug_message(key);

		var value = file_grid[# 3, i];
		show_debug_message(value);
		ds_map_add(m, key, value);
	}
	
	ds_grid_destroy(file_grid);
	show_debug_message("csv_loader end!!!!")
	return data;
}