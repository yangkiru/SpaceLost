// call function in room creation code
function csv_loader(){
	var file_grid = load_csv("data.csv");
	global.data = ds_map_create();
	var m = noone;

	var hh = ds_grid_height(file_grid);
	for (var i = 1; i < hh; i++;)
	{
		var group = file_grid[# 1, i];
		if (group != "") { // new group
			m = ds_map_create();
			ds_map_add_map(global.data, group, m);
		}
		var key = file_grid[# 2, i];
		
		if (key == "") continue;

		var value = file_grid[# 3, i];
		
		show_debug_message(key + " " + value);
		
		ds_map_add(m, key, value);
	}
}