// @description Insert description here
anchor = o_player_ship;
rope_length = global.data[? "player"][? "rope_length"];
show_debug_message(rope_length);
rope_length = real(rope_length);

physics_set_density(self, global.data[? "player"][? "density"]);
physics_joint_distance_create(self, anchor, x, y, anchor.x, anchor.y, rope_length);