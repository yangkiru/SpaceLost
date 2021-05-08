/// @description Insert description here
// You can write your code in this editor

parent = obj_player_ship;
offset = -68;
depth = parent.depth - 1;

physics_joint_weld_create(self, parent, phy_position_x, phy_position_y + offset, 0, 1, 1, 0);