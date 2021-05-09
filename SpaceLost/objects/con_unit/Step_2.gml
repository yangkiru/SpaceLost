if grab == -2
	grab = -1;
	
if (control != object_index && state == States.Idle && phy_speed > 1) { // head to ship
	
	var dir = point_direction(0, 0, phy_speed_x, -phy_speed_y) + 90;
	var rspeed = 5;
	phy_rotation += sin(degtorad(dir - phy_rotation)) * rspeed;
}