/// @description Insert description here
// You can write your code in this editor

follower = obj_player_ship;
offset = -45;

physics_joint_weld_create(self, follower, phy_position_x, phy_position_y + offset, 0, 1, 1, 0);