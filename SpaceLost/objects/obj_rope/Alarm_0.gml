/// @description Rotate

phy_rotation = parent.phy_rotation;

startDist = point_distance(xstart, ystart, parent.x, parent.y);
phy_position_x = parent.x + lengthdir_x(startDist, parent.phy_rotation);
phy_position_y = parent.y + lengthdir_y(startDist, parent.phy_rotation);