if (control != object_index) {
	//var target = connector != noone ? connector : control;
	if (connector != noone)
		draw_line_width_colour(phy_position_x, phy_position_y, connector.phy_position_x, connector.phy_position_y, 10, c, c);
	else
		draw_line_width_colour(phy_position_x, phy_position_y, control.phy_position_x, control.phy_position_y, 10, c, c);
}

draw_self();