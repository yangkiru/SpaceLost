draw_self();

var dir = point_direction(0, 0, phy_speed_x, phy_speed_y);
motion_blur(phy_speed * 5, dir);