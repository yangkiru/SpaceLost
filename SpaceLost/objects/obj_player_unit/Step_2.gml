/// @description Insert description here
// You can write your code in this editor

if grab == -2
	grab = -1;
	
if !control && state == States.Idle { // head to ship
	var dir = point_direction(ship.phy_position_x, phy_position_y, phy_position_x, ship.phy_position_y) - 90;
	var rspeed = 2;
	phy_rotation += sin(degtorad(dir - phy_rotation)) * rspeed;
}

//dummy.phy_position_x = phy_position_x;
//dummy.phy_position_y = phy_position_y;
//dummy.phy_speed_x = phy_speed_x;
//dummy.phy_speed_y = phy_speed_y;
//dummy.phy_rotation = phy_rotation;
//dummy.phy_angular_velocity = phy_angular_velocity;