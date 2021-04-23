/// @description Insert description here
// You can write your code in this editor

phy_rotation = parent != -1 ? parent.phy_rotation + rot : rot;

if (parent == -1) return;

startDist = point_distance(xstart, ystart, parent.x, parent.y);
phy_position_x = parent.x + lengthdir_x(startDist, parent.image_angle);
phy_position_y = parent.y + lengthdir_y(startDist, parent.image_angle);