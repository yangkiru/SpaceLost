/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

spr_original = spr_ship_boost_left;
spr_boost = spr_ship_overdrive_left;

if (parent.bInput) sprite_index = spr_boost;
else sprite_index = spr_original;

dust_rangeX = 0;
dust_rangeY = sprite_height * 0.5;