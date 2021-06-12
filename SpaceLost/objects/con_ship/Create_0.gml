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
bMax = real(ship_data[? "bMax"]);
bCurrent = bMax;
bConsume = real(ship_data[? "bConsume"]);
bCoolSpd = real(ship_data[? "bCoolSpd"]);
const_kb = real(ship_data[? "const_kb"]);
oil_max = real(ship_data[? "oil_max"]);
oil = oil_max;
oil_cons = real(ship_data[? "oil_cons"]);

hInput = 0;
vInput = 0;
bInput = 0;
force_dir = 0;
owner = noone;
parent = object_get_parent(object_index);
camera_zoom = 2;
target = noone;

depth = ObjectDepth.Ship;

spr_original = noone;
spr_shoot = noone;

bHeat = 0;

on_destroy = noone;
on_destroy_var = noone;

hit_color_create();

function damage(value, attacker) {
	hp -= value;
	hit_color_damage();
	
	if (hp <= 0) { // Destroy
		destroy(attacker);
	} else show_debug_message(object_get_name(object_index) + " got " + string(value) + " damage!");
}

function destroy(attacker) {
	show_debug_message("destroy");
	if (owner != noone)
		owner.control = owner;
	if (on_destroy != noone)
		script_execute(on_destroy, on_destroy_var);
	instance_destroy(self);
}