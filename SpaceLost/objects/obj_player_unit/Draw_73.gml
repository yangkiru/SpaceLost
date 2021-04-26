if (rope_ready) return;
var spd = 0.1;
rope_rot = rope_rot > 360 ? rope_rot - 360 + spd : rope_rot + spd;
//draw_sprite_ext(glowCircle, -1, x, y, 0.03 * rope_length, 0.03 * rope_length, 0, c_red, 0.7);
draw_sprite_ext(spr_green_circle, -1, x, y, 0.075 * rope_length, 0.075 * rope_length, rope_rot, c_white, 1);
//var inner_radius = rope_length * 15;
//var thickness = 3;
//var segments = 50;
//var jadd = 360/segments;
//draw_set_color(c_orange);
//draw_primitive_begin(pr_trianglestrip);
//for (var j = 0; j <= 360; j+=jadd)
//{
//    draw_vertex(x+lengthdir_x(inner_radius,j),y+lengthdir_y(inner_radius,j));
//    draw_vertex(x+lengthdir_x(inner_radius+thickness,j),y+lengthdir_y(inner_radius+thickness,j));
//}
//draw_primitive_end();
