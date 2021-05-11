/// @description Insert description here
// You can write your code in this editor

show_debug_message("mind control");
var is_mind_control = owner == obj_player_unit;
owner = is_mind_control ? object_index : obj_player_unit;
obj_player_unit.owner = is_mind_control ? obj_player_unit : noone;

con_camera.follow = is_mind_control ? obj_player_unit : object_index;