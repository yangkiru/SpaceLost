trail = scr_create_trail_ext(spr_trail_basic, 0, 10, 1, .5, 0,0.5,150,1,1,1);
instance_create_layer(x, y, "Instances", obj_coin_destroy);
alarm[1] = 1;