// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_distance(a, b, is_sqrt){
	var _xd = b.x - a.x;
	var _yd = b.y - a.y;
	var _add =  _xd * _xd + _yd * _yd;
	if (is_sqrt != noone && is_sqrt)
		return sqrt(_add);
	else
		return _add
}