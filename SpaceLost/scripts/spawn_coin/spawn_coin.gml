// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function spawn_coin(_var){
	var attacker = _var[| 0];
	var amount = _var[| 1];
	var _target = _var[| 2];
	show_debug_message(string(amount) + " coin get");
	var angle = irandom(360);
	var gap = 360 / amount;
	repeat(amount) {
		var coin = instance_create_layer(x, y, "Instances", obj_coin);
		var force = random_range(1, 1);
		var xx = lengthdir_x(force, angle);
		var yy = lengthdir_y(force, angle);
		
		with (coin) {
			physics_apply_impulse(x, y, xx, yy);
			target = _target;
		}
		
		angle += gap;
	}
}