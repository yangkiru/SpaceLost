/// @description Insert description here
// You can write your code in this editor

if grab == -2
	grab = -1;
	
if !control { // head to ship
	var dir = point_direction(ship.phy_position_x, phy_position_y, phy_position_x, ship.phy_position_y) - 90;
	var rspeed = 2;
	phy_rotation += sin(degtorad(dir - phy_rotation)) * rspeed;
}