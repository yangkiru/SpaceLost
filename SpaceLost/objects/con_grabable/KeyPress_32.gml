/// @description Grab

if obj_player_unit.grab == -1 && !grab && instance_position(x, y, obj_player_unit) { // grab
	grab = true;
	obj_player_unit.grab = self;
	obj_player_unit.sprite_index = spr_player_idle_grab;
}
else if grab { // drop
	grab = false;
	obj_player_unit.grab = -2; // player's end step에서 grab 가능
	if obj_player_unit.move_target != -1
		obj_player_unit.sprite_index = spr_player_idle;
	else
		obj_player_unit.sprite_index = spr_player_swim;
}