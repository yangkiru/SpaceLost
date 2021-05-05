var bs = global.data[? "basic_ship"];
mSpd = real(bs[? "mSpd"]);	// move speed
mSpd_const = real(bs[? "mSpd_const"]); // for big number
tSpd = real(bs[? "tSpd"]); // turn speed
tSpd_const = real(bs[? "tSpd_const"]); // for big number
bmSpd = real(bs[? "bmSpd"]);
btSpd = real(bs[? "btSpd"]);

hInput = 0;
vInput = 0;
bInput = 0;
hInput_last = 0;
vInput_last = 0;

control = false;
connected = noone;
boost = false;

depth = 2;

connector = obj_connector;

