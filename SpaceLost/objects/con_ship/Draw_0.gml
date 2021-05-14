draw_self();
draw_arrow(x, y, x + hInput * 500, y - vInput * 500, 50);
var dir = -phy_rotation - 90;//point_direction(x, y, x - phy_speed_x, y - phy_speed_y);
motion_blur(phy_speed * 3, dir);