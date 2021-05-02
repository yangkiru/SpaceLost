/// @description Insert description here
// You can write your code in this editor

if grab == -2
	grab = -1;
	
if !control { // head to ship
	var dir = point_direction(ship.x, y, x, ship.y) - 90;
	var rspeed = 5;
	phy_rotation += sin(degtorad(dir - phy_rotation)) * 1;
	
	//show_debug_message(string(dir) + " " + string(phy_rotation));
	
	//var pd = point_direction(ship.phy_position_x, phy_position_y, 
}