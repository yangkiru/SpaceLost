function spawn_coin(_var){
	var _attacker = _var[? "attacker"];
	var _amount = _var[? "amount"];
	show_debug_message(string(_amount) + " coin get");
	var angle = irandom(360);
	var gap = 360 / _amount;
	repeat(_amount) {
		var coin = obj_coin_pool.activate_obj();
		var force = random_range(0.1, 0.5);
		var xx = lengthdir_x(force, angle);
		var yy = lengthdir_y(force, angle);
		
		with (coin) {
			phy_position_x = other.phy_position_x;
			phy_position_y = other.phy_position_y;
			physics_apply_impulse(phy_position_x, phy_position_y, xx, yy);
			target = _attacker;
		}
		
		angle += gap;
	}
}