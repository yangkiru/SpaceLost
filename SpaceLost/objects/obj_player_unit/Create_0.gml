// @description Insert description here
anchor = obj_player_ship;
rope_length = global.data[? "player"][? "rope_length"];
show_debug_message(rope_length);
rope_length = real(rope_length);
rope_ready = false;
rope = -1;

physics_set_density(self, global.data[? "player"][? "density"]);

//application_surface_draw_enable(0);
bloomIntensity = shader_get_uniform(shdr_bloom, "intensity");
bloomblurSize = shader_get_uniform(shdr_bloom, "blurSize");