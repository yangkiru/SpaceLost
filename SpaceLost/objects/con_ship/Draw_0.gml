draw_self();
draw_arrow(x, y, x + hInput * 500, y - vInput * 500, 50);
if (bInput) {
	var dir = -phy_rotation - 90;//point_direction(x, y, x - phy_speed_x, y - phy_speed_y);
	motion_blur(phy_speed * 3, dir);
}

var bWidth = 200;
var bPer = bCurrent / bMax;
if (bMax != 0) bWidth = bWidth * bPer;

var bWidthHalf = bWidth * 0.5;
var bPosY = 250;
var bHeight = 50;
var c = merge_color(c_red, c_lime, bPer);

draw_roundrect_color_ext(x - bWidthHalf, y + bPosY, x + bWidthHalf, y + bPosY + bHeight, 30, 30, c, c, 0);