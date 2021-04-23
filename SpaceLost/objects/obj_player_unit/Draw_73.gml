if (rope_ready) return;

var inner_radius = rope_length * 15;
var thickness = 4;
var segments = 50;
var jadd = 360/segments;
draw_set_color(c_orange);
draw_primitive_begin(pr_trianglestrip);
for (var j = 0; j <= 360; j+=jadd)
{
    draw_vertex(x+lengthdir_x(inner_radius,j),y+lengthdir_y(inner_radius,j));
    draw_vertex(x+lengthdir_x(inner_radius+thickness,j),y+lengthdir_y(inner_radius+thickness,j));
}
draw_primitive_end();

