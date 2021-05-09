unit_data = global.data[? "player"];
event_inherited();
connector = instance_create_layer(x, y, "Instances", obj_connector);

spr_idle = spr_player_idle;
spr_idle_grab = spr_player_idle_grab;
spr_swim = spr_player_swim;
spr_swim_grab = spr_player_swim_grab;
spr_fly = spr_player_fly;