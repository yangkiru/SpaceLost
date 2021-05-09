/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

var _seq = layer_sequence_create("Instances", x, y, seq_em_movement);
var _seq_inst = layer_sequence_get_instance(_seq);
sequence_instance_override_object(_seq_inst, con_em_unit, self);