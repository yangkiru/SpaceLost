function spawn_coin(_var){
	var _attacker = _var[? "attacker"];
	var _amount = _var[? "amount"];
	show_debug_message(string(_amount) + " coin get");
	var angle = irandom(360);
	var gap = 360 / _amount;
	repeat(_amount) {
		var coin = instance_create_layer(x, y, "Instances", obj_coin);
		var force = random_range(0.1, 0.8);
		var xx = lengthdir_x(force, angle);
		var yy = lengthdir_y(force, angle);
		
		with (coin) {
			physics_apply_impulse(x, y, xx, yy);
			target = _attacker;
		}
		
		angle += gap;
	}
}