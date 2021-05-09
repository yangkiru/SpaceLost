unit_data = global.data[? "player"];
event_inherited();
tSpd = real(unit_data[? "tSpd"]);
tSpd_const = real(unit_data[? "tSpd_const"]);
rope_rot_spd = real(unit_data[? "rope_rot_spd"]);
rope_circle_alpha = real(unit_data[? "rope_circle_alpha"]);
connector = instance_create_layer(x, y, "Instances", obj_connector);

spr_idle = spr_player_idle;
spr_idle_grab = spr_player_idle_grab;
spr_swim = spr_player_swim;
spr_swim_grab = spr_player_swim_grab;
spr_fly = spr_player_fly;