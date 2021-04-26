/// @description move
var _eventType = event_data[? "event_type"];
var _message = event_data[? "message"];
if (_eventType == "sprite event") {
	switch (_message) {
		case "move":
			if control { // Control player
				var sum = abs(hInput) + abs(vInput);
				var spd = mSpd * mSpd_const;
				if sum != 0
					physics_apply_impulse(phy_position_x, phy_position_y, spd * hInput / sum, spd * vInput / sum);
			} else { // Contorl ship
				var pd = point_direction(phy_position_x,phy_position_y,target_x,target_y);
				var spd = mSpd * mSpd_const;
				var lx = lengthdir_x(spd, pd);
				var ly = lengthdir_y(spd, pd);
				var sum = abs(lx) + abs(ly);
					
				physics_apply_impulse(phy_position_x,phy_position_y,spd * lx / sum, spd * ly / sum);
			}
		break;
	}
}