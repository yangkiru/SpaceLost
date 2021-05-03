// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_rope(obj1, obj2, length){
	physics_joint_distance_create(obj1, obj2, obj1.x, obj1.y, obj2.x, obj2.y, length);
}