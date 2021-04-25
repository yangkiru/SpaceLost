/// @description Grab

if !grab && instance_position(x, y, obj_player_unit) {
	grab = true;
	obj_player_unit.grab = self;
	obj_player_unit.sprite_index = spr_player_swim_grab;
}
else if grab {
	grab = false;
	obj_player_unit.grab = -1;
	if obj_player_unit.move_target != -1
		obj_player_unit.sprite_index = spr_player_idle;
	else
		obj_player_unit.sprite_index = spr_player_swim;
}