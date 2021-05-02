/// @description Set player's target to this

obj_player_unit.move_target = self;
obj_player_unit.state = States.MoveStart;
obj_player_unit.target_x = phy_position_x;
obj_player_unit.target_y = phy_position_y;