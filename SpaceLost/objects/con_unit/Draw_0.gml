if (control != object_index) {
		//var target = connector != noone ? connector : control;
		if (connector != noone)
			draw_line_width_colour(phy_position_x, phy_position_y, connector.phy_position_x, connector.phy_position_y, 10, c, c);
		else
			draw_line_width_colour(phy_position_x, phy_position_y, control.phy_position_x, control.phy_position_y, 10, c, c);
}

if (control == object_index && owner == obj_player_unit) {
	rope_rot = rope_rot > 360 ? rope_rot - 360 + rope_rot_spd : rope_rot + rope_rot_spd;
	var inner_radius = rope_length * 3;
	var thickness = 4;
	draw_set_color(c_lime);
	draw_set_alpha(rope_circle_alpha);

	var pattern = array_create_ext(1,2,0,0,0,0,0,0,0,2,-1,0);
	for (var j = 0; j <= 360; j++) {
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
	// closet ship
	//if (closet_ship != noone && instance_exists(closet_ship) && closet_ship_dist <= rope_length * 1.4) {
	//	draw_line_width_colour(x, y, closet_ship.x, closet_ship.y, 5, c, c);
	//	draw_circle_color(closet_ship.x, closet_ship.y, 6, c, c, 0);
	//}
}


draw_self();

if (control == object_index && owner == obj_player_unit || oxygen < oxygen_max) {
	draw_set_color(c_white);
	if (control == owner)
		draw_set_font(fnt_oxygen_p);
	else if (control.parent == con_ship)
		draw_set_font(fnt_oxygen_s);
	draw_set_halign(fa_center);
	var str = "Oxygen " + string(oxygen / oxygen_max * 100) + "%";
	draw_text_outline(x, y - 120, c_blue, c_aqua, str);
}