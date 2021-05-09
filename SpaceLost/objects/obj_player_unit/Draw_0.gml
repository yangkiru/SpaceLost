if (control == object_index) {
	rope_rot = rope_rot > 360 ? rope_rot - 360 + rope_rot_spd : rope_rot + rope_rot_spd;
	var inner_radius = rope_length * 15;
	var thickness = 4;
	draw_set_color(c_lime);
	draw_set_alpha(rope_circle_alpha);

	var pattern = array_create_ext(1,2,0,0,0,0,0,0,0,2,-1,0);
	for (var j = 0; j <= 360; j++)
	{
		if (pattern[j % array_length_1d(pattern)] == 1)
			draw_primitive_begin(pr_trianglestrip);
		if (pattern[j % array_length_1d(pattern)] == 2) {
			draw_vertex(x+lengthdir_x(inner_radius,j+rope_rot),y+lengthdir_y(inner_radius,j+rope_rot));
			draw_vertex(x+lengthdir_x(inner_radius+thickness,j+rope_rot),y+lengthdir_y(inner_radius+thickness,j+rope_rot));
		}
		if (pattern[j % array_length_1d(pattern)] == -1)
			draw_primitive_end();
	}
	draw_set_alpha(1);
} else {
	var c = make_color_rgb(238,23,93);
	draw_line_width_colour(round(phy_position_x), round(phy_position_y), round(connector.phy_position_x), round(connector.phy_position_y), 10, c, c);
}

draw_self();