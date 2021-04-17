/// @description Insert description here
// You can write your code in this editor

var file_grid = load_csv("data.csv");
data = ds_map_create();

var hh = ds_grid_height(file_grid);
show_debug_message(hh);
for (var i = 1; i < hh; i++;)
{
	show_debug_message(file_grid[# 0, i] + " " + file_grid[# 1, i]);
	var key = file_grid[# 0, i];
	var value = file_grid[# 1, i];
	if (key != "")
		ds_map_add(data, key, value);
}

show_debug_message(data[? "mSpd_const"]);