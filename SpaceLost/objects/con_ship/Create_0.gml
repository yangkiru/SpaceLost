// Variable Settings
// ship_data = global.data[? "ship_name"];

mSpd = real(ship_data[? "mSpd"]);
mSpd_const = real(ship_data[? "mSpd_const"]);
tSpd = real(ship_data[? "tSpd"]);
tSpd_const = real(ship_data[? "tSpd_const"]);
bmSpd = real(ship_data[? "bmSpd"]);
btSpd = real(ship_data[? "btSpd"]);
hp_max = real(ship_data[? "hp_max"]);
hp = hp_max;
//

hInput = 0;
vInput = 0;
bInput = 0;
force_dir = 0;
owner = noone;
parent = object_get_parent(object_index);
camera_zoom = 2;
target = noone;

depth = ObjectDepth.Ship;

function damage(value) {
	hp -= value;
	
	if (hp <= 0) {
		show_debug_message(object_get_name(object_index) + " destroyed!");
	} else show_debug_message(object_get_name(object_index) + " got " + string(value) + " damage!");
}