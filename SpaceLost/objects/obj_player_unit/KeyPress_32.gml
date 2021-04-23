/// @description Connect

if (distance_to_object(anchor) <= rope_length * 10) {
	rope = instance_create(anchor.x, anchor.y, obj_rope_create);
	rope.image_xscale = rope_length;
	rope.anchor_1 = self;
	rope.anchor_2 = anchor;
	rope.init = true;
}