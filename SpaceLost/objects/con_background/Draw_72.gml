var ss = 0.05;
var ms = 0.1;
var ls = 0.27;
draw_sprite_tiled(spr_bg_s, 0, x - con_camera.x * ss, y - con_camera.y * ss);
draw_sprite_tiled(spr_bg_m, 0, x - con_camera.x * ms, y - con_camera.y * ms);
draw_sprite_tiled(spr_bg_l, 0, x - con_camera.x * ls, y - con_camera.y * ls);