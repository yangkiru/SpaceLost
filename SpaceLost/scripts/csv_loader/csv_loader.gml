// call function in room creation code
function csv_loader(directory){
	var file_grid = load_csv(directory);
	var data = ds_map_create();
	var m = noone;
	if (!ds_exists(file_grid, ds_type_grid)) {
		return noone;
	}
	var hh = ds_grid_height(file_grid);
	for (var i = 1; i < hh; i++;)
	{
		var group = file_grid[# 1, i];
		if (group != "") { // new group
			m = ds_map_create();
			ds_map_add_map(data, group, m);
		}
		var key = file_grid[# 2, i];
		
		if (key == "") continue;

		var value = file_grid[# 3, i];
		
		ds_map_add(m, key, value);
	}
	ds_grid_destroy(file_grid);
	return data;
}