draw_self();

var dir = point_direction(phy_speed_x, phy_speed_y, 0, 0);
motion_blur(phy_speed * 3.5, dir);