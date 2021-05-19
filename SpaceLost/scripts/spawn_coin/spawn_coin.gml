// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function spawn_coin(_var){
	var attacker = _var[| 0];
	var amount = _var[| 1];
	var _target = _var[| 2];
	show_debug_message(string(amount) + " coin get");
	repeat(amount) {
		var coin = instance_create_layer(x, y, "Instances", obj_coin);
		with (coin) {
			var xx = irandom_range(0, 1) == 0 ? 1 : -1 * random_range(3, 5);
			var yy = irandom_range(0, 1) == 0 ? 1 : -1 * random_range(3, 5);
			physics_apply_impulse(x, y, xx, yy);
			target = _target;
		}
	}
}