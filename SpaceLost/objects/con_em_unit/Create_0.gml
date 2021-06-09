/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

on_destroy = spawn_coin;
ds_map_add(on_destroy_var, "amount", irandom_range(10, 15));

function move() {
	enemy_movement();
}

function enemy_movement() {
	if (isKey && !in_sequence) {
		var _seq = layer_sequence_create("Instances", x, y, seq_em_movement);
		var _seq_inst = layer_sequence_get_instance(_seq);
		sequence_instance_override_object(_seq_inst, con_em_unit, self);
		layer_sequence_speedscale(_seq, 0.8);
	}
}