if (!init) return;

q = ds_queue_create();
length = image_xscale;
xx = 16;

// Create initial segments
obj1 = instance_create(x - (sprite_width * 0.5), y, obj_rope_start);
obj2 = instance_create(x - (sprite_width * 0.5) + xx, y, obj_rope);
physics_joint_revolute_create(obj1, obj2, obj1.x, obj1.y, -1, 1, 1, 0, 0, 0, 0);

ds_queue_enqueue(q, obj1);
ds_queue_enqueue(q, obj2);
// Make sure to give first segment a parent (used for drawing)
obj1.parent = obj2;
obj2.parent = obj1;

// Loop through rest of bridge

var i;
for (i = 0; i < length - 2; ++i) {
	xx += 16;
	// Move to next segment
	obj1 = obj2;
	obj2 = instance_create(x - (sprite_width * 0.5) + xx, y, obj_rope);
	physics_joint_revolute_create(obj1, obj2, obj1.x, obj1.y, -1, 1, 0, 0 , 0, 0, 0);
	ds_queue_enqueue(q, obj1);
	obj2.parent = obj1;
}

// End segment
xx += 16;

obj1 = obj2;
obj2 = instance_create(x - (sprite_width * 0.5) + xx, y, obj_rope_start);
physics_joint_revolute_create(obj1, obj2, obj2.x, obj2.y, -1, 1, 0, 0, 0, 0, 0);
ds_queue_enqueue(q, obj2);
obj2.parent = obj1;

init = false;