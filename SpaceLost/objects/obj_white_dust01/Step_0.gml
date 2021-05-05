var spd;

spd = 0.005;

image_xscale -= spd;
image_yscale -= spd;

if (spd <= 0 )instance_destroy();

