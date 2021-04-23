/// @description Connect

if (distance_to_object(anchor) > rope_length * 10) return;
rope = instance_create(anchor.x, anchor.y, obj_rope_create);
rope.image_xscale = rope_length;
rope.init = true;

alarm[0] = 1;