var bs = global.data[? "basic_ship"];
mSpd = real(bs[? "mSpd"]);	// move speed
mSpd_const = real(bs[? "mSpd_const"]); // for big number
tSpd = real(bs[? "tSpd"]); // turn speed
tSpd_const = real(bs[? "tSpd_const"]); // for big number
bmSpd = real(bs[? "bmSpd"]);
btSpd = real(bs[? "btSpd"]);

hInput_last = 0;
vInput_last = 0;
rope_ready = false;

control = false;
