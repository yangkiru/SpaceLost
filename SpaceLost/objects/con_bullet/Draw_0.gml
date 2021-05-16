/// @description Insert description here
// You can write your code in this editor
//draw_self();
var dir = point_direction(x, y, x - phy_speed_x, y - phy_speed_y);
motion_blur(phy_speed * 2, dir);


if (owner == obj_enemy_ship) draw_circle(x, y, 100, 1);
else draw_self();