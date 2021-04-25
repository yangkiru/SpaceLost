/// @description Insert description here
var p = global.data[? "player"];
mSpd = real(p[? "mSpd"]);	// move speed
mSpd_const = real(p[? "mSpd_const"]); // for big number
tSpd = real(p[? "tSpd"]); // turn speed
tSpd_const = real(p[? "tSpd_const"]); // for big number

hInput_last = 0;
vInput_last = 0;
rope_ready = false;