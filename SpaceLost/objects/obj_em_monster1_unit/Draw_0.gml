if (rope != noone) {
	var c = make_color_rgb(0,255,130);
	draw_line_width_colour(round(phy_position_x), round(phy_position_y), round(connector.phy_position_x), round(connector.phy_position_y), 10, c, c);
}
draw_self();