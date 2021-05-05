
if (connected != noone) {
	var c = make_color_rgb(238,23,93);
	draw_line_width_colour(round(phy_position_x), round(phy_position_y), round(ship.connector.phy_position_x), round(ship.connector.phy_position_y), 10, c, c);
}

draw_self();